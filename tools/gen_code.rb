#!/usr/bin/env ruby

require 'json'

class CodeGen
  def initialize(json)
    @json = json
    @indent_cnt = 0
    @indent_str = '  '
  end

  def indent
    @indent_cnt += 1
  end

  def unindent
    @indent_cnt -= 1
  end

  def put(s="")
    if s == ""
      puts
    else
      puts @indent_str * @indent_cnt + s.to_s
    end
  end

  def nest
    indent
    yield
    unindent
  end
end

class RubyGen < CodeGen
  def run
    put "class Client"
    indent

    @json['constant_sets'].each do |const_set|
      if const_set['name'] == 'Error'
        put "class #{const_set['name']} < Exception"
      else
        put "class #{const_set['name']}"
      end

      nest do
        const_set['constants'].each do |const|
          put "# #{const['doc']}"
          put "#{const['name']} = #{const['id']}"
        end

        put
        put "def initialize(n)"
        nest { put "@n = n" }
        put "end"

        put
        put "def to_s"
        nest do
          put "case @n"
          const_set['constants'].each do |const|
            put "when #{const['id']} then '#{const['name']}'"
          end
          put "end"
        end
        put "end"

      end
      put "end"
      put
    end

    @json['command_sets'].each do |cmd_set|
      put "# #{cmd_set['name']}"
      cs_name = lower(cmd_set['name'])
      cs_id = cmd_set['id']

      cmd_set['commands'].each do |cmd|
        cmd_name = lower(cmd['name'])

        if cmd['events']
          put "def parse_#{cs_name}_#{cmd_name}(pl)"
          nest do
            put "i = 0"
            decode_data(cmd['events'])
            put "return #{get_retval(cmd['events'])}"
          end
          put "end"
          next
        end

        args = get_args(cmd['outputs']) * ', '
        put "def #{cs_name}_#{cmd_name}(#{args})"

        nest do
          put "pl = ''"
          encode_data(cmd['outputs'])
          put "send(#{cs_id}, #{cmd['id']}, pl)"

          put

          put "resp = recv_id"
          if !cmd['replies'].empty?
            put "pl = resp.pl"
            put "i = 0"
            decode_data(cmd['replies'])
            put "return #{get_retval(cmd['replies'])}"
          end
        end

        put "end"
        put
      end
    end

    unindent
    put "end"
  end

  def get_args(data)
    data.map{|o|lower(o['name'])}
  end

  def get_retval(data)
    retval = get_args(data) * ', '
    if data.size == 1
      retval
    else
      "[#{retval}]"
    end
  end

  def encode_data(data)
    data.each do |d|
      name = lower(d['name'])
      type = d['type']
      if d['repeated']
        put %Q(raise "#{name} must be an Array" if !#{name}.is_a?(Array))

        raise "#{name} (#{type})" if type != 'int'
        put %Q(pl += [#{name}.size].pack("N"))

        args = get_args(d['repeated']) * ', '
        put "#{name}.each do |#{args}|"
        nest { encode_data(d['repeated']) }
        put "end"

      elsif d['cases']
        put %Q(raise "#{name} must be an Array" if !#{name}.is_a?(Array))
        raise "#{name} (#{type})" if type != 'byte'
        put %Q(pl += [#{name}[0]].pack("c"))

        put %Q(case_values = #{name}[1..-1])
        put %Q(case #{name}[0])
        d['cases'].each do |kase|
          raise if name != lower(kase['target'])
          put %Q(when #{kase['value']} # #{kase['name']})
          args = get_args(kase['union']) * ', '
          nest {
            put "#{args}, _ = case_values"
            encode_data(kase['union'])
          }
        end

        put "else"
        nest { put %Q(raise "Unknown #{name}: \#{#{name}[0]}") }
        put "end"

      elsif type == 'string'
        put %Q(raise "#{name} must be a String" if !#{name}.is_a?(String))
        put %Q(pl += [#{name}.size].pack("N") + #{name})

      elsif %w(byte int).include?(type)
        put %Q(raise "#{name} must be a Integer" if !#{name}.is_a?(Integer))

        if type == 'byte'
          put %Q(pl += [#{name}].pack("c"))
        elsif type == 'int'
          put %Q(pl += [#{name}].pack("N"))
        else
          raise
        end

      elsif %w(long objectID threadID threadGroupID stringID classLoaderID
               classObjectID arrayID referenceTypeID classID interfaceID
               arrayTypeID methodID fieldID frameID
              ).include?(type)
        put %Q(raise "#{name} must be a Integer" if !#{name}.is_a?(Integer))
        put %Q(pl += [#{name}>>32, #{name}&0xffffffff].pack("NN"))

      elsif %w(value tagged-objectID).include?(type)
        put %Q(raise "#{name} must be a TaggedValue" if !#{name}.is_a?(TaggedValue))
        put %Q(pl += encode_value(#{name}))

      else
        put %Q(raise "#{name} (#{type}) is not implemented yet")
      end
    end
  end

  def decode_data(data)
    data.each do |d|
      name = lower(d['name'])
      type = d['type']
      if d['repeated']
        raise "#{name} (#{type})" if type != 'int'

        put %Q(#{name} = [])
        put %Q(sz = pl[i,4].unpack("N")[0]; i += 4)

        put %Q(sz.times do)
        nest do
          decode_data(d['repeated'])
          put "#{name} << #{get_retval(d['repeated'])}"
        end
        put "end"

      elsif d['cases']
        raise "#{name} (#{type})" if type != 'byte'

        put %Q(#{name} = pl[i,1].unpack("c"); i += 1)

        put %Q(case #{name}[0])
        d['cases'].each do |kase|
          raise if name != lower(kase['target'])
          c = kase['value'].sub(/^JDWP./, '').gsub('.', '::')
          put %Q(when #{c} # #{kase['name']})
          nest {
            decode_data(kase['union'])
            args = get_args(kase['union']) * ', '
            put "#{name} += [#{args}]"
          }
        end

        put "else"
        nest { put %Q(raise "Unknown #{name}: \#{#{name}[0]}") }
        put "end"

      elsif type == 'string'
        put %Q(sz = pl[i,4].unpack("N")[0]; i += 4)
        put %Q(#{name} = pl[i,sz]; i += sz)

      elsif type == 'byte'
        put %Q(#{name} = pl[i,1].unpack("c")[0]; i += 1)
      elsif type == 'int'
        put %Q(#{name} = pl[i,4].unpack("N")[0]; i += 4)
      elsif %w(long objectID threadID threadGroupID stringID classLoaderID
               classObjectID arrayID referenceTypeID classID interfaceID
               arrayTypeID methodID fieldID frameID
               ).include?(type)
        put %Q(#{name} = pl[i,8].unpack("NN"); i += 8)
        put %Q(#{name} = #{name}[0] << 32 | #{name}[1])

      elsif type == 'location'
        put %Q(#{name} = pl[i,1+8+8+8]; i += 1+8+8+8)
      elsif %w(value tagged-objectID).include?(type)
        put %Q(#{name}, i = decode_value(pl, i))
      else
        put %Q(raise "#{name} (#{type}) is not implemented yet")
      end
    end
  end

  def lower(s)
    s = s.gsub(/[A-Z]/) do
      d=$&.downcase
      $`[0] ? "_#{d}" : d
    end.gsub(/(^|_)i_d(_|$)/, '\\1id\\2')
    if s == 'end'
      s = 'end_'
    end
    s
  end

end

json = JSON.load(File.read('tools/jdwp-protocol.json'))

RubyGen.new(json).run


