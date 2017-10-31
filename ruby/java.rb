require 'socket'

require_relative 'client'

class Java

  class Module
    def initialize(name)
      @name = name
    end
  end

  class Class
    def initialize(mod, name)
      @mod = mod
      @name = name
    end
  end

  class MethodMirror
    attr_reader :id, :arg_tags

    def initialize(j, id, name, sig, mod)
      @j = j
      @id = id
      @name = name
      @sig = sig
      @mod = mod

      @arg_tags = []
      raise if @sig !~ /^\((.*)\)/
      $1.scan(/L.*?;|[ZBCSIJFD\[]|(.)/) do
        raise @sig if $1
        @arg_tags << $&[0]
      end
    end

    def field?
      @sig == '()'
    end
  end

  class TypeMirror
    attr_reader :ref_id

    def initialize(j, cls, tag, ref_id, sig, gsig, status)
      @j = j
      @cls = cls
      @tag = tag
      @ref_id = ref_id
      @sig = sig
      @gsig = gsig
      @status = status
      @cls_id = @j.client.reference_type_class_object(@ref_id)

      @methods = {}
      @static_methods = {}

      @j.client.reference_type_fields(ref_id).each do |id, name, sig, mod|
        method = MethodMirror.new(@j, id, name, '()', mod)
        if (mod & ACC_STATIC) != 0
          map = @static_methods
        else
          map = @methods
        end
        (map[name] ||= []) << method
      end

      @j.client.reference_type_methods(ref_id).each do |id, name, sig, mod|
        next if name == '<clinit>'
        method = MethodMirror.new(@j, id, name, sig, mod)
        if (mod & ACC_STATIC) != 0
          map = @static_methods
        else
          map = @methods
        end 
       (map[name] ||= []) << method
      end

      @static_methods.each do |name, method|
        tm = self
        @cls.define_singleton_method(name) do |*args|
          tm.invoke(nil, name, args)
        end
      end

      @methods.each do |name, method|
        tm = self
        if name == '<init>'
          @cls.send(:define_method, 'initialize') do |*args|
            if args.size == 1 && args[0].is_a?(Client::ObjectID)
              @id = args[0].id
            else
              @id = tm.invoke(self, name, args)
            end
          end
        else
          @cls.send(:define_method, name) do |*args|
            tm.invoke(self, name, args)
          end
        end
      end

    end

    def encode_args(arg_tags, args)
      if arg_tags.size != args.size
        return nil
      end

      total_score = 0
      ret = []
      arg_tags.zip(args).each do |tag, arg|
        score = 10
        if arg.is_a?(TrueClass) || arg.is_a?(FalseClass)
          return nil if tag != 'Z'
        elsif arg.is_a?(Integer)
          score = {
            'B' => 1,
            'C' => 2,
            'S' => 3,
            'I' => 6,
            'J' => 10,
          }[tag]
          return nil if !score
        elsif arg.is_a?(Float)
          return nil if !'FD'.include?(tag)
          score = 6 if tag == 'F'
        elsif arg.is_a?(String)
          if arg.size == 1 && tag == 'B'
            arg = arg.ord
          elsif tag == 'L'
            sid = @j.client.virtual_machine_create_string(arg)
            arg = Client::StringID.new(sid)
          else
            return nil
          end
        else
          raise "Not implemented: #{arg}"
        end
        ret << Client::TaggedValue.new(tag, arg)
        total_score += score
      end
      [total_score, ret]
    end

    def resolve_method(methods, name, args, typ)
      if !methods
        raise "No such #{typ} method `#{name}` in #{@sig}"
      end

      resolved = []
      methods.each do |method|
        score, ea = encode_args(method.arg_tags, args)
        next if !ea
        resolved << [score, method, ea]
      end

      if resolved.empty?
        raise "No overload for #{typ} method `#{name}` in #{@sig}"
      end
      return resolved
    end

    def invoke(this, name, args)
      typ = this ? :instance : :static
      methods = this ? @methods[name] : @static_methods[name]
      resolved = resolve_method(methods, name, args, typ)

      retval = nil
      exceptions = []
      resolved.sort_by{|s,m,e|-s}.each do |_, method, ea|
        if name == '<init>'
          retval, exception = @j.client.class_type_new_instance(
                    @cls_id, @j.main_tid, method.id, ea, 0)
        elsif this
          obj_id = this.instance_variable_get(:@id)
          if method.field?
            retval = @j.client.object_reference_get_values(obj_id, [method.id])
            retval = retval[0]
          else
            retval, exception = @j.client.object_reference_invoke_method(
                      obj_id, @j.main_tid, @cls_id, method.id, ea, 0)
          end
        else
          if method.field?
            retval = @j.client.reference_type_get_values(@ref_id, [method.id])
            retval = retval[0]
          else
            retval, exception = @j.client.class_type_invoke_method(
                      @cls_id, @j.main_tid, method.id, ea, 0)
          end
        end

        if exception
          exceptions << exception
          next
        else
          break
        end
      end

      if !exceptions.empty?
        raise "There is an exception in #{@sig}#{name}: #{exceptions}"
      end

      if name == '<init>'
        return retval.id
      end

      @j.resolve_id(retval)
    end

  end

  # https://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html#jvms-4.6
  ACC_PUBLIC = 0x0001
  ACC_PRIVATE = 0x0002
  ACC_PROTECTED = 0x0004
  ACC_STATIC = 0x0008
  ACC_FINAL = 0x0010
  ACC_SYNCHRONIZED = 0x0020
  ACC_BRIDGE = 0x0040
  ACC_VARARGS = 0x0080
  ACC_NATIVE = 0x0100
  ACC_ABSTRACT = 0x0400
  ACC_STRICT = 0x0800
  ACC_SYNTHETIC = 0x1000

  def initialize(cls, clspath)
    @id2obj = {}
    @id2obj[0] = nil
    @id2cls = {}

    address = "localhost:8000"
    jdwp_ops = "-agentlib:jdwp=transport=dt_socket,server=y,address=#{address}"
    cmd = ['java', jdwp_ops, '-classpath', clspath, cls]
    @pid = spawn(*cmd)

    begin
      @sock = nil
      1000.times do
        begin
          @sock = TCPSocket.new('localhost', 8000)
          break
        rescue
          sleep 0.001
        end
      end
      if !@sock
        raise "Failed to start"
      end

      @client = Client.new(@sock)
      @client.handshake

      # Skip VM_START.
      @client.wait_event

      # Run a single step to activate the VM.
      @client.event_request_set(Client::EventKind::SINGLE_STEP,
                                Client::SuspendPolicy::ALL,
                                [[1, 1], [10, 1, 0, 0]])  # one-off.
      @client.virtual_machine_resume
      @client.wait_event

      init_env
    rescue
      terminate
      raise
    end
  end

  def client
    @client
  end

  def main_tid
    @main_tid
  end

  def init_env
    @thread_ids = @client.virtual_machine_all_threads
    @thread_ids.each do |tid|
      name = @client.thread_reference_name(tid)
      if name == 'main'
        @main_tid = tid
      end
    end

    load_classes(@client.virtual_machine_all_classes_with_generic)
  end

  def load_classes(all_classes)
    modules = []
    types = []
    all_classes.each do
      |tag, ref_id, sig, gsig, status|
      next if sig !~ /^L([\w\/\$]+);/
      cls_fqn = $1
      *mod, cls_name = cls_fqn.split('/')
      types << [
        mod, cls_name, [tag, ref_id, sig, gsig, status]
      ]
      modules << mod
    end

    modules = modules.sort.uniq.map do |mod|
      (1..mod.size).map{|l|mod[0,l]}
    end.flatten(1).sort.uniq

    module_map = {}
    modules.each do |mod|
      module_map[mod] = m = Module.new(mod)
      if mod.size > 1
        parent = mod[0,mod.size-1]
        module_map[parent].define_singleton_method(mod[-1]) do
          m
        end
      else
        Java.define_singleton_method(mod[0]) do
          m
        end
      end
    end

    types.each do |mod, cls_name, type|
      rbname = ["Java", *mod, cls_name.gsub('$', '__')] * '_'
      cls = eval("class #{rbname}; end; #{rbname}")
      type = TypeMirror.new(self, cls, *type)
      @id2cls[type.ref_id] = cls
      module_map[mod].define_singleton_method(cls_name) do
        cls
      end
    end

  end

  def resolve_id(v)
    if !v.respond_to?(:id)
      return v
    end

    id = v.id
    obj = @id2obj[id]
    return obj if obj

    obj = if v.is_a?(Client::ObjectID)
            tag, ref_id = @client.object_reference_reference_type(v.id)
            if tag != Client::TypeTag::CLASS
              raise "Not implemented yet"
            end
            cls = @id2cls[ref_id]
            if !cls
              sig, gsig = @client.reference_type_signature_with_generic(ref_id)
              load_classes([[nil, ref_id, sig, gsig, nil]])
              cls = @id2cls[ref_id]
            end
            cls.new(v)
          elsif v.is_a?(Client::StringID)
            @client.string_reference_value(id)
          else
            raise "Not implemented #{v}"
          end
    @id2obj[id] = obj
  end

  def terminate
    begin
      Process.kill(:KILL, @pid)
      Process.waitpid(@pid, Process::WNOHANG)
    rescue
    end
  end

  def self.start(cls, clspath)
    @@java = Java.new(cls, clspath)

    begin
      yield
    ensure
      @@java.terminate
    end
  end

end

if $0 == __FILE__
  Java::start('debuggee', 'test') do
    java = Java::java
    p java.lang
    p java.lang.System
    #p java.lang.System.gc()
    #p java.lang.System.console
    p java.lang.String.new
    #p java.lang.Exception.new
    p java.io.File.new("foo")
    p java.lang.String.valueOf(true)
    p java.lang.String.valueOf(4.2)
    p java.io.File.new("foo//bar").toString()
    p java.io.File.new("foo//bar").isDirectory()
    p java.io.File.new("foo//bar").getParentFile()
    p java.lang.System.console
    p java.lang.System.out
    p java.lang.System.out.println("Hello, world!")
    p java.lang.System.console.writer
    #p java.lang.System.out.hashCode
  end
end
