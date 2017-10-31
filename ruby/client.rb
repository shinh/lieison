# coding: utf-8
require_relative 'command'

class Client

  HANDSHAKE = 'JDWP-Handshake'

  def initialize(chan)
    @chan = chan
    @next_id = 0
    @async_events = []
  end

  def handshake
    @chan.write(HANDSHAKE)
    if HANDSHAKE != @chan.read(HANDSHAKE.size)
      raise 'Handshake failed'
    end
  end

  def next_id
    (@next_id += 1) % (2 ** 32)
  end

  def send(command_set, command, pl='')
    req = Request.new(next_id, command_set, command, pl)
    @chan.write(req.encode)
  end

  def recv
    header = @chan.read(Response::HEADER_LEN)
    if !header
      raise 'Premature end of the debuggee'
    end

    length, id, flags, command_set, command = header.unpack(Request::PACK_FMT)
    if flags == 0
      pl = @chan.read(length - Request::HEADER_LEN)
      Request.new(id, command_set, command, pl)
    else
      Response.new(header){|l|
        @chan.read(l)
      }
    end
  end

  def queue_async_events(req)
    suspend_policy, events = parse_event_composite(req.pl)
    @async_events += events
  end

  def recv_id
    while true
      resp = recv
      if resp.is_a?(Request)
        if resp.command_set != 64 || resp.command != 100
          raise "Unknown type of request from VM: #{resp}"
        end
        queue_async_events(resp)
      else
        if resp.id != @next_id
          raise "Unexpected reply from VM (recv_id): #{resp}"
        end
        if resp.error != 0
          raise Error.new(resp.error)
        end
        return resp
      end
    end
  end

  def wait_event
    while true
      if !@async_events.empty?
        return @async_events.shift
      end

      resp = recv
      if resp.is_a?(Response)
        raise "Unexpected reply from VM (wait_event): #{resp}"
      end
      queue_async_events(resp)
    end
  end

  class ID
    attr_reader :id
    def initialize(id)
      @id = id
    end
  end

  class ObjectID < ID ; end
  class StringID < ID ; end
  class ThreadID < ID ; end
  class ThreadGroupID < ID ; end
  class ClassLoaderID < ID ; end
  class ClassID < ID ; end
  class ArrayID < ID ; end

  def decode_value(pl, i)
    tag = pl[i]
    i += 1
    case tag
    when 'Z'
      [pl[i,1].unpack('c')[0] == 1, i+1]
    when 'B'
      [pl[i,1].unpack('c')[0], i+1]
    when /C|S/
      [pl[i,2].unpack('n')[0], i+2]
    when 'I'
      [pl[i,4].unpack('N')[0], i+4]
    when 'J'
      a, b = pl[i,8].unpack('NN')
      [a << 32 | b, i+8]
    when 'V'
      [nil, i]
    when 'F'
      [pl[i,4].unpack('g')[0], i+4]
    when 'D'
      [pl[i,4].unpack('G')[0], i+4]
    else
      cls = {
        'L' => ObjectID,
        's' => StringID,
        't' => ThreadID,
        'g' => ThreadGroupID,
        'l' => ClassLoaderID,
        'c' => ClassID,
        '[' => ArrayID,
      }[tag]
      if !cls
        raise "Unknown tag for a value: #{tag}"
      end
      a, b = pl[i,8].unpack('NN')
      v = a << 32 | b
      v = v == 0 ? nil : cls.new(v)
      [v, i+8]
    end
  end

  class TaggedValue
    attr_reader :tag, :v
    def initialize(tag, v)
      @tag = tag
      @v = v
    end
  end

  def encode_value(tv)
    v = tv.v
    r = case tv.tag
        when 'Z'
          [v ? 1 : 0].pack('c')
        when 'B'
          [v].pack('c')
        when /C|S/
          [v].pack('n')
        when 'I'
          [v].pack('N')
        when 'J'
          [v>>32, v&0xffffffff].pack('NN')
        when 'F'
          [v].pack('g')
        when 'D'
          [v].pack('G')
        when 'L'
          v = v.id
          [v>>32, v&0xffffffff].pack('NN')
        else
          raise "Unknown tag for a value: #{tag}"
        end
    tv.tag + r
  end


end

require_relative 'gen_client'

if $0 == __FILE__
end
