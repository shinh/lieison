class Client
  class Error < Exception
    # No error has occurred.
    NONE = 0
    # Passed thread is null, is not a valid thread or has exited.
    INVALID_THREAD = 10
    # Thread group invalid.
    INVALID_THREAD_GROUP = 11
    # Invalid priority.
    INVALID_PRIORITY = 12
    # If the specified thread has not been suspended by an event.
    THREAD_NOT_SUSPENDED = 13
    # Thread already suspended.
    THREAD_SUSPENDED = 14
    # Thread has not been started or is now dead.
    THREAD_NOT_ALIVE = 15
    # If this reference type has been unloaded and garbage collected.
    INVALID_OBJECT = 20
    # Invalid class.
    INVALID_CLASS = 21
    # Class has been loaded but not yet prepared.
    CLASS_NOT_PREPARED = 22
    # Invalid method.
    INVALID_METHODID = 23
    # Invalid location.
    INVALID_LOCATION = 24
    # Invalid field.
    INVALID_FIELDID = 25
    # Invalid jframeID.
    INVALID_FRAMEID = 30
    # There are no more Java or JNI frames on the call stack.
    NO_MORE_FRAMES = 31
    # Information about the frame is not available.
    OPAQUE_FRAME = 32
    # Operation can only be performed on current frame.
    NOT_CURRENT_FRAME = 33
    # The variable is not an appropriate type for the function used.
    TYPE_MISMATCH = 34
    # Invalid slot.
    INVALID_SLOT = 35
    # Item already set.
    DUPLICATE = 40
    # Desired element not found.
    NOT_FOUND = 41
    # Invalid monitor.
    INVALID_MONITOR = 50
    # This thread doesn't own the monitor.
    NOT_MONITOR_OWNER = 51
    # The call has been interrupted before completion.
    INTERRUPT = 52
    # The virtual machine attempted to read a class file and determined that the file is malformed or otherwise cannot be interpreted as a class file.
    INVALID_CLASS_FORMAT = 60
    # A circularity has been detected while initializing a class.
    CIRCULAR_CLASS_DEFINITION = 61
    # The verifier detected that a class file, though well formed, contained some sort of internal inconsistency or security problem.
    FAILS_VERIFICATION = 62
    # Adding methods has not been implemented.
    ADD_METHOD_NOT_IMPLEMENTED = 63
    # Schema change has not been implemented.
    SCHEMA_CHANGE_NOT_IMPLEMENTED = 64
    # The state of the thread has been modified, and is now inconsistent.
    INVALID_TYPESTATE = 65
    # A direct superclass is different for the new class version, or the set of directly implemented interfaces is different and canUnrestrictedlyRedefineClasses is false.
    HIERARCHY_CHANGE_NOT_IMPLEMENTED = 66
    # The new class version does not declare a method declared in the old class version and canUnrestrictedlyRedefineClasses is false.
    DELETE_METHOD_NOT_IMPLEMENTED = 67
    # A class file has a version number not supported by this VM.
    UNSUPPORTED_VERSION = 68
    # The class name defined in the new class file is different from the name in the old class object.
    NAMES_DONT_MATCH = 69
    # The new class version has different modifiers and and canUnrestrictedlyRedefineClasses is false.
    CLASS_MODIFIERS_CHANGE_NOT_IMPLEMENTED = 70
    # A method in the new class version has different modifiers than its counterpart in the old class version and and canUnrestrictedlyRedefineClasses is false.
    METHOD_MODIFIERS_CHANGE_NOT_IMPLEMENTED = 71
    # The functionality is not implemented in this virtual machine.
    NOT_IMPLEMENTED = 99
    # Invalid pointer.
    NULL_POINTER = 100
    # Desired information is not available.
    ABSENT_INFORMATION = 101
    # The specified event type id is not recognized.
    INVALID_EVENT_TYPE = 102
    # Illegal argument.
    ILLEGAL_ARGUMENT = 103
    # The function needed to allocate memory and no more memory was available for allocation.
    OUT_OF_MEMORY = 110
    # Debugging has not been enabled in this virtual machine. JVMTI cannot be used.
    ACCESS_DENIED = 111
    # The virtual machine is not running.
    VM_DEAD = 112
    # An unexpected internal error has occurred.
    INTERNAL = 113
    # The thread being used to call this function is not attached to the virtual machine. Calls must be made from attached threads.
    UNATTACHED_THREAD = 115
    # object type id or class tag.
    INVALID_TAG = 500
    # Previous invoke not complete.
    ALREADY_INVOKING = 502
    # Index is invalid.
    INVALID_INDEX = 503
    # The length is invalid.
    INVALID_LENGTH = 504
    # The string is invalid.
    INVALID_STRING = 506
    # The class loader is invalid.
    INVALID_CLASS_LOADER = 507
    # The array is invalid.
    INVALID_ARRAY = 508
    # Unable to load the transport.
    TRANSPORT_LOAD = 509
    # Unable to initialize the transport.
    TRANSPORT_INIT = 510
    # 
    NATIVE_METHOD = 511
    # The count is invalid.
    INVALID_COUNT = 512

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'NONE'
      when 10 then 'INVALID_THREAD'
      when 11 then 'INVALID_THREAD_GROUP'
      when 12 then 'INVALID_PRIORITY'
      when 13 then 'THREAD_NOT_SUSPENDED'
      when 14 then 'THREAD_SUSPENDED'
      when 15 then 'THREAD_NOT_ALIVE'
      when 20 then 'INVALID_OBJECT'
      when 21 then 'INVALID_CLASS'
      when 22 then 'CLASS_NOT_PREPARED'
      when 23 then 'INVALID_METHODID'
      when 24 then 'INVALID_LOCATION'
      when 25 then 'INVALID_FIELDID'
      when 30 then 'INVALID_FRAMEID'
      when 31 then 'NO_MORE_FRAMES'
      when 32 then 'OPAQUE_FRAME'
      when 33 then 'NOT_CURRENT_FRAME'
      when 34 then 'TYPE_MISMATCH'
      when 35 then 'INVALID_SLOT'
      when 40 then 'DUPLICATE'
      when 41 then 'NOT_FOUND'
      when 50 then 'INVALID_MONITOR'
      when 51 then 'NOT_MONITOR_OWNER'
      when 52 then 'INTERRUPT'
      when 60 then 'INVALID_CLASS_FORMAT'
      when 61 then 'CIRCULAR_CLASS_DEFINITION'
      when 62 then 'FAILS_VERIFICATION'
      when 63 then 'ADD_METHOD_NOT_IMPLEMENTED'
      when 64 then 'SCHEMA_CHANGE_NOT_IMPLEMENTED'
      when 65 then 'INVALID_TYPESTATE'
      when 66 then 'HIERARCHY_CHANGE_NOT_IMPLEMENTED'
      when 67 then 'DELETE_METHOD_NOT_IMPLEMENTED'
      when 68 then 'UNSUPPORTED_VERSION'
      when 69 then 'NAMES_DONT_MATCH'
      when 70 then 'CLASS_MODIFIERS_CHANGE_NOT_IMPLEMENTED'
      when 71 then 'METHOD_MODIFIERS_CHANGE_NOT_IMPLEMENTED'
      when 99 then 'NOT_IMPLEMENTED'
      when 100 then 'NULL_POINTER'
      when 101 then 'ABSENT_INFORMATION'
      when 102 then 'INVALID_EVENT_TYPE'
      when 103 then 'ILLEGAL_ARGUMENT'
      when 110 then 'OUT_OF_MEMORY'
      when 111 then 'ACCESS_DENIED'
      when 112 then 'VM_DEAD'
      when 113 then 'INTERNAL'
      when 115 then 'UNATTACHED_THREAD'
      when 500 then 'INVALID_TAG'
      when 502 then 'ALREADY_INVOKING'
      when 503 then 'INVALID_INDEX'
      when 504 then 'INVALID_LENGTH'
      when 506 then 'INVALID_STRING'
      when 507 then 'INVALID_CLASS_LOADER'
      when 508 then 'INVALID_ARRAY'
      when 509 then 'TRANSPORT_LOAD'
      when 510 then 'TRANSPORT_INIT'
      when 511 then 'NATIVE_METHOD'
      when 512 then 'INVALID_COUNT'
      end
    end
  end

  class EventKind
    # 
    SINGLE_STEP = 1
    # 
    BREAKPOINT = 2
    # 
    FRAME_POP = 3
    # 
    EXCEPTION = 4
    # 
    USER_DEFINED = 5
    # 
    THREAD_START = 6
    # 
    THREAD_DEATH = 7
    # obsolete - was used in jvmdi
    THREAD_END = 7
    # 
    CLASS_PREPARE = 8
    # 
    CLASS_UNLOAD = 9
    # 
    CLASS_LOAD = 10
    # 
    FIELD_ACCESS = 20
    # 
    FIELD_MODIFICATION = 21
    # 
    EXCEPTION_CATCH = 30
    # 
    METHOD_ENTRY = 40
    # 
    METHOD_EXIT = 41
    # 
    METHOD_EXIT_WITH_RETURN_VALUE = 42
    # 
    MONITOR_CONTENDED_ENTER = 43
    # 
    MONITOR_CONTENDED_ENTERED = 44
    # 
    MONITOR_WAIT = 45
    # 
    MONITOR_WAITED = 46
    # 
    VM_START = 90
    # obsolete - was used in jvmdi
    VM_INIT = 90
    # 
    VM_DEATH = 99
    # Never sent across JDWP
    VM_DISCONNECTED = 100

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 1 then 'SINGLE_STEP'
      when 2 then 'BREAKPOINT'
      when 3 then 'FRAME_POP'
      when 4 then 'EXCEPTION'
      when 5 then 'USER_DEFINED'
      when 6 then 'THREAD_START'
      when 7 then 'THREAD_DEATH'
      when 7 then 'THREAD_END'
      when 8 then 'CLASS_PREPARE'
      when 9 then 'CLASS_UNLOAD'
      when 10 then 'CLASS_LOAD'
      when 20 then 'FIELD_ACCESS'
      when 21 then 'FIELD_MODIFICATION'
      when 30 then 'EXCEPTION_CATCH'
      when 40 then 'METHOD_ENTRY'
      when 41 then 'METHOD_EXIT'
      when 42 then 'METHOD_EXIT_WITH_RETURN_VALUE'
      when 43 then 'MONITOR_CONTENDED_ENTER'
      when 44 then 'MONITOR_CONTENDED_ENTERED'
      when 45 then 'MONITOR_WAIT'
      when 46 then 'MONITOR_WAITED'
      when 90 then 'VM_START'
      when 90 then 'VM_INIT'
      when 99 then 'VM_DEATH'
      when 100 then 'VM_DISCONNECTED'
      end
    end
  end

  class ThreadStatus
    # 
    ZOMBIE = 0
    # 
    RUNNING = 1
    # 
    SLEEPING = 2
    # 
    MONITOR = 3
    # 
    WAIT = 4

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'ZOMBIE'
      when 1 then 'RUNNING'
      when 2 then 'SLEEPING'
      when 3 then 'MONITOR'
      when 4 then 'WAIT'
      end
    end
  end

  class SuspendStatus
    # 
    SUSPEND_STATUS_SUSPENDED = 0

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'SUSPEND_STATUS_SUSPENDED'
      end
    end
  end

  class ClassStatus
    # 
    VERIFIED = 1
    # 
    PREPARED = 2
    # 
    INITIALIZED = 4
    # 
    ERROR = 8

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 1 then 'VERIFIED'
      when 2 then 'PREPARED'
      when 4 then 'INITIALIZED'
      when 8 then 'ERROR'
      end
    end
  end

  class TypeTag
    # ReferenceType is a class.
    CLASS = 1
    # ReferenceType is an interface.
    INTERFACE = 2
    # ReferenceType is an array.
    ARRAY = 3

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 1 then 'CLASS'
      when 2 then 'INTERFACE'
      when 3 then 'ARRAY'
      end
    end
  end

  class Tag
    # '[' - an array object (objectID size).
    ARRAY = 91
    # 'B' - a byte value (1 byte).
    BYTE = 66
    # 'C' - a character value (2 bytes).
    CHAR = 67
    # 'L' - an object (objectID size).
    OBJECT = 76
    # 'F' - a float value (4 bytes).
    FLOAT = 70
    # 'D' - a double value (8 bytes).
    DOUBLE = 68
    # 'I' - an int value (4 bytes).
    INT = 73
    # 'J' - a long value (8 bytes).
    LONG = 74
    # 'S' - a short value (2 bytes).
    SHORT = 83
    # 'V' - a void value (no bytes).
    VOID = 86
    # 'Z' - a boolean value (1 byte).
    BOOLEAN = 90
    # 's' - a String object (objectID size).
    STRING = 115
    # 't' - a Thread object (objectID size).
    THREAD = 116
    # 'g' - a ThreadGroup object (objectID size).
    THREAD_GROUP = 103
    # 'l' - a ClassLoader object (objectID size).
    CLASS_LOADER = 108
    # 'c' - a class object object (objectID size).
    CLASS_OBJECT = 99

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 91 then 'ARRAY'
      when 66 then 'BYTE'
      when 67 then 'CHAR'
      when 76 then 'OBJECT'
      when 70 then 'FLOAT'
      when 68 then 'DOUBLE'
      when 73 then 'INT'
      when 74 then 'LONG'
      when 83 then 'SHORT'
      when 86 then 'VOID'
      when 90 then 'BOOLEAN'
      when 115 then 'STRING'
      when 116 then 'THREAD'
      when 103 then 'THREAD_GROUP'
      when 108 then 'CLASS_LOADER'
      when 99 then 'CLASS_OBJECT'
      end
    end
  end

  class StepDepth
    # Step into any method calls that occur before the end of the step.
    INTO = 0
    # Step over any method calls that occur before the end of the step.
    OVER = 1
    # Step out of the current method.
    OUT = 2

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'INTO'
      when 1 then 'OVER'
      when 2 then 'OUT'
      end
    end
  end

  class StepSize
    # Step by the minimum possible amount (often a bytecode instruction).
    MIN = 0
    # Step to the next source line unless there is no line number information in which case a MIN step is done instead.
    LINE = 1

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'MIN'
      when 1 then 'LINE'
      end
    end
  end

  class SuspendPolicy
    # Suspend no threads when this event is encountered.
    NONE = 0
    # Suspend the event thread when this event is encountered.
    EVENT_THREAD = 1
    # Suspend all threads when this event is encountered.
    ALL = 2

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'NONE'
      when 1 then 'EVENT_THREAD'
      when 2 then 'ALL'
      end
    end
  end

  class InvokeOptions
    # otherwise, all threads started.
    INVOKE_SINGLE_THREADED = 0
    # otherwise, normal virtual invoke (instance methods only)
    INVOKE_NONVIRTUAL = 0

    def initialize(n)
      @n = n
    end

    def to_s
      case @n
      when 0 then 'INVOKE_SINGLE_THREADED'
      when 0 then 'INVOKE_NONVIRTUAL'
      end
    end
  end

  # VirtualMachine
  def virtual_machine_version()
    pl = ''
    send(1, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    description = pl[i,sz]; i += sz
    jdwp_major = pl[i,4].unpack("N")[0]; i += 4
    jdwp_minor = pl[i,4].unpack("N")[0]; i += 4
    sz = pl[i,4].unpack("N")[0]; i += 4
    vm_version = pl[i,sz]; i += sz
    sz = pl[i,4].unpack("N")[0]; i += 4
    vm_name = pl[i,sz]; i += sz
    return [description, jdwp_major, jdwp_minor, vm_version, vm_name]
  end

  def virtual_machine_classes_by_signature(signature)
    pl = ''
    raise "signature must be a String" if !signature.is_a?(String)
    pl += [signature.size].pack("N") + signature
    send(1, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    classes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
      type_id = pl[i,8].unpack("NN"); i += 8
      type_id = type_id[0] << 32 | type_id[1]
      status = pl[i,4].unpack("N")[0]; i += 4
      classes << [ref_type_tag, type_id, status]
    end
    return classes
  end

  def virtual_machine_all_classes()
    pl = ''
    send(1, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    classes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
      type_id = pl[i,8].unpack("NN"); i += 8
      type_id = type_id[0] << 32 | type_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      status = pl[i,4].unpack("N")[0]; i += 4
      classes << [ref_type_tag, type_id, signature, status]
    end
    return classes
  end

  def virtual_machine_all_threads()
    pl = ''
    send(1, 4, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    threads = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      thread = pl[i,8].unpack("NN"); i += 8
      thread = thread[0] << 32 | thread[1]
      threads << thread
    end
    return threads
  end

  def virtual_machine_top_level_thread_groups()
    pl = ''
    send(1, 5, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    groups = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      group = pl[i,8].unpack("NN"); i += 8
      group = group[0] << 32 | group[1]
      groups << group
    end
    return groups
  end

  def virtual_machine_dispose()
    pl = ''
    send(1, 6, pl)

    resp = recv_id
  end

  def virtual_machine_id_sizes()
    pl = ''
    send(1, 7, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    field_id_size = pl[i,4].unpack("N")[0]; i += 4
    method_id_size = pl[i,4].unpack("N")[0]; i += 4
    object_id_size = pl[i,4].unpack("N")[0]; i += 4
    reference_type_id_size = pl[i,4].unpack("N")[0]; i += 4
    frame_id_size = pl[i,4].unpack("N")[0]; i += 4
    return [field_id_size, method_id_size, object_id_size, reference_type_id_size, frame_id_size]
  end

  def virtual_machine_suspend()
    pl = ''
    send(1, 8, pl)

    resp = recv_id
  end

  def virtual_machine_resume()
    pl = ''
    send(1, 9, pl)

    resp = recv_id
  end

  def virtual_machine_exit(exit_code)
    pl = ''
    raise "exit_code must be a Integer" if !exit_code.is_a?(Integer)
    pl += [exit_code].pack("N")
    send(1, 10, pl)

    resp = recv_id
  end

  def virtual_machine_create_string(utf)
    pl = ''
    raise "utf must be a String" if !utf.is_a?(String)
    pl += [utf.size].pack("N") + utf
    send(1, 11, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    string_object = pl[i,8].unpack("NN"); i += 8
    string_object = string_object[0] << 32 | string_object[1]
    return string_object
  end

  def virtual_machine_capabilities()
    pl = ''
    send(1, 12, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    raise "can_watch_field_modification (boolean) is not implemented yet"
    raise "can_watch_field_access (boolean) is not implemented yet"
    raise "can_get_bytecodes (boolean) is not implemented yet"
    raise "can_get_synthetic_attribute (boolean) is not implemented yet"
    raise "can_get_owned_monitor_info (boolean) is not implemented yet"
    raise "can_get_current_contended_monitor (boolean) is not implemented yet"
    raise "can_get_monitor_info (boolean) is not implemented yet"
    return [can_watch_field_modification, can_watch_field_access, can_get_bytecodes, can_get_synthetic_attribute, can_get_owned_monitor_info, can_get_current_contended_monitor, can_get_monitor_info]
  end

  def virtual_machine_class_paths()
    pl = ''
    send(1, 13, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    base_dir = pl[i,sz]; i += sz
    classpaths = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      sz = pl[i,4].unpack("N")[0]; i += 4
      path = pl[i,sz]; i += sz
      classpaths << path
    end
    bootclasspaths = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      sz = pl[i,4].unpack("N")[0]; i += 4
      path = pl[i,sz]; i += sz
      bootclasspaths << path
    end
    return [base_dir, classpaths, bootclasspaths]
  end

  def virtual_machine_dispose_objects(requests)
    pl = ''
    raise "requests must be an Array" if !requests.is_a?(Array)
    pl += [requests.size].pack("N")
    requests.each do |object, ref_cnt|
      raise "object must be a Integer" if !object.is_a?(Integer)
      pl += [object>>32, object&0xffffffff].pack("NN")
      raise "ref_cnt must be a Integer" if !ref_cnt.is_a?(Integer)
      pl += [ref_cnt].pack("N")
    end
    send(1, 14, pl)

    resp = recv_id
  end

  def virtual_machine_hold_events()
    pl = ''
    send(1, 15, pl)

    resp = recv_id
  end

  def virtual_machine_release_events()
    pl = ''
    send(1, 16, pl)

    resp = recv_id
  end

  def virtual_machine_capabilities_new()
    pl = ''
    send(1, 17, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    raise "can_watch_field_modification (boolean) is not implemented yet"
    raise "can_watch_field_access (boolean) is not implemented yet"
    raise "can_get_bytecodes (boolean) is not implemented yet"
    raise "can_get_synthetic_attribute (boolean) is not implemented yet"
    raise "can_get_owned_monitor_info (boolean) is not implemented yet"
    raise "can_get_current_contended_monitor (boolean) is not implemented yet"
    raise "can_get_monitor_info (boolean) is not implemented yet"
    raise "can_redefine_classes (boolean) is not implemented yet"
    raise "can_add_method (boolean) is not implemented yet"
    raise "can_unrestrictedly_redefine_classes (boolean) is not implemented yet"
    raise "can_pop_frames (boolean) is not implemented yet"
    raise "can_use_instance_filters (boolean) is not implemented yet"
    raise "can_get_source_debug_extension (boolean) is not implemented yet"
    raise "can_request_v_m_death_event (boolean) is not implemented yet"
    raise "can_set_default_stratum (boolean) is not implemented yet"
    raise "can_get_instance_info (boolean) is not implemented yet"
    raise "can_request_monitor_events (boolean) is not implemented yet"
    raise "can_get_monitor_frame_info (boolean) is not implemented yet"
    raise "can_use_source_name_filters (boolean) is not implemented yet"
    raise "can_get_constant_pool (boolean) is not implemented yet"
    raise "can_force_early_return (boolean) is not implemented yet"
    raise "reserved22 (boolean) is not implemented yet"
    raise "reserved23 (boolean) is not implemented yet"
    raise "reserved24 (boolean) is not implemented yet"
    raise "reserved25 (boolean) is not implemented yet"
    raise "reserved26 (boolean) is not implemented yet"
    raise "reserved27 (boolean) is not implemented yet"
    raise "reserved28 (boolean) is not implemented yet"
    raise "reserved29 (boolean) is not implemented yet"
    raise "reserved30 (boolean) is not implemented yet"
    raise "reserved31 (boolean) is not implemented yet"
    raise "reserved32 (boolean) is not implemented yet"
    return [can_watch_field_modification, can_watch_field_access, can_get_bytecodes, can_get_synthetic_attribute, can_get_owned_monitor_info, can_get_current_contended_monitor, can_get_monitor_info, can_redefine_classes, can_add_method, can_unrestrictedly_redefine_classes, can_pop_frames, can_use_instance_filters, can_get_source_debug_extension, can_request_v_m_death_event, can_set_default_stratum, can_get_instance_info, can_request_monitor_events, can_get_monitor_frame_info, can_use_source_name_filters, can_get_constant_pool, can_force_early_return, reserved22, reserved23, reserved24, reserved25, reserved26, reserved27, reserved28, reserved29, reserved30, reserved31, reserved32]
  end

  def virtual_machine_redefine_classes(classes)
    pl = ''
    raise "classes must be an Array" if !classes.is_a?(Array)
    pl += [classes.size].pack("N")
    classes.each do |ref_type, classfile|
      raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
      pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
      raise "classfile must be an Array" if !classfile.is_a?(Array)
      pl += [classfile.size].pack("N")
      classfile.each do |classbyte|
        raise "classbyte must be a Integer" if !classbyte.is_a?(Integer)
        pl += [classbyte].pack("c")
      end
    end
    send(1, 18, pl)

    resp = recv_id
  end

  def virtual_machine_set_default_stratum(stratum_id)
    pl = ''
    raise "stratum_id must be a String" if !stratum_id.is_a?(String)
    pl += [stratum_id.size].pack("N") + stratum_id
    send(1, 19, pl)

    resp = recv_id
  end

  def virtual_machine_all_classes_with_generic()
    pl = ''
    send(1, 20, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    classes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
      type_id = pl[i,8].unpack("NN"); i += 8
      type_id = type_id[0] << 32 | type_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      generic_signature = pl[i,sz]; i += sz
      status = pl[i,4].unpack("N")[0]; i += 4
      classes << [ref_type_tag, type_id, signature, generic_signature, status]
    end
    return classes
  end

  def virtual_machine_instance_counts(ref_types_count)
    pl = ''
    raise "ref_types_count must be an Array" if !ref_types_count.is_a?(Array)
    pl += [ref_types_count.size].pack("N")
    ref_types_count.each do |ref_type|
      raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
      pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    end
    send(1, 21, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    counts = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      instance_count = pl[i,8].unpack("NN"); i += 8
      instance_count = instance_count[0] << 32 | instance_count[1]
      counts << instance_count
    end
    return counts
  end

  # ReferenceType
  def reference_type_signature(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    signature = pl[i,sz]; i += sz
    return signature
  end

  def reference_type_class_loader(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    class_loader = pl[i,8].unpack("NN"); i += 8
    class_loader = class_loader[0] << 32 | class_loader[1]
    return class_loader
  end

  def reference_type_modifiers(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    mod_bits = pl[i,4].unpack("N")[0]; i += 4
    return mod_bits
  end

  def reference_type_fields(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 4, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    declared = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      field_id = pl[i,8].unpack("NN"); i += 8
      field_id = field_id[0] << 32 | field_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      mod_bits = pl[i,4].unpack("N")[0]; i += 4
      declared << [field_id, name, signature, mod_bits]
    end
    return declared
  end

  def reference_type_methods(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 5, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    declared = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      method_id = pl[i,8].unpack("NN"); i += 8
      method_id = method_id[0] << 32 | method_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      mod_bits = pl[i,4].unpack("N")[0]; i += 4
      declared << [method_id, name, signature, mod_bits]
    end
    return declared
  end

  def reference_type_get_values(ref_type, fields)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "fields must be an Array" if !fields.is_a?(Array)
    pl += [fields.size].pack("N")
    fields.each do |field_id|
      raise "field_id must be a Integer" if !field_id.is_a?(Integer)
      pl += [field_id>>32, field_id&0xffffffff].pack("NN")
    end
    send(2, 6, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    values = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      value, i = decode_value(pl, i)
      values << value
    end
    return values
  end

  def reference_type_source_file(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 7, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    source_file = pl[i,sz]; i += sz
    return source_file
  end

  def reference_type_nested_types(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 8, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    classes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
      type_id = pl[i,8].unpack("NN"); i += 8
      type_id = type_id[0] << 32 | type_id[1]
      classes << [ref_type_tag, type_id]
    end
    return classes
  end

  def reference_type_status(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 9, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    status = pl[i,4].unpack("N")[0]; i += 4
    return status
  end

  def reference_type_interfaces(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 10, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    interfaces = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      interface_type = pl[i,8].unpack("NN"); i += 8
      interface_type = interface_type[0] << 32 | interface_type[1]
      interfaces << interface_type
    end
    return interfaces
  end

  def reference_type_class_object(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 11, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    class_object = pl[i,8].unpack("NN"); i += 8
    class_object = class_object[0] << 32 | class_object[1]
    return class_object
  end

  def reference_type_source_debug_extension(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 12, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    extension = pl[i,sz]; i += sz
    return extension
  end

  def reference_type_signature_with_generic(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 13, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    signature = pl[i,sz]; i += sz
    sz = pl[i,4].unpack("N")[0]; i += 4
    generic_signature = pl[i,sz]; i += sz
    return [signature, generic_signature]
  end

  def reference_type_fields_with_generic(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 14, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    declared = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      field_id = pl[i,8].unpack("NN"); i += 8
      field_id = field_id[0] << 32 | field_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      generic_signature = pl[i,sz]; i += sz
      mod_bits = pl[i,4].unpack("N")[0]; i += 4
      declared << [field_id, name, signature, generic_signature, mod_bits]
    end
    return declared
  end

  def reference_type_methods_with_generic(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 15, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    declared = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      method_id = pl[i,8].unpack("NN"); i += 8
      method_id = method_id[0] << 32 | method_id[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      generic_signature = pl[i,sz]; i += sz
      mod_bits = pl[i,4].unpack("N")[0]; i += 4
      declared << [method_id, name, signature, generic_signature, mod_bits]
    end
    return declared
  end

  def reference_type_instances(ref_type, max_instances)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "max_instances must be a Integer" if !max_instances.is_a?(Integer)
    pl += [max_instances].pack("N")
    send(2, 16, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    instances = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      instance, i = decode_value(pl, i)
      instances << instance
    end
    return instances
  end

  def reference_type_class_file_version(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 17, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    major_version = pl[i,4].unpack("N")[0]; i += 4
    minor_version = pl[i,4].unpack("N")[0]; i += 4
    return [major_version, minor_version]
  end

  def reference_type_constant_pool(ref_type)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    send(2, 18, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    count = pl[i,4].unpack("N")[0]; i += 4
    bytes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      cpbytes = pl[i,1].unpack("c")[0]; i += 1
      bytes << cpbytes
    end
    return [count, bytes]
  end

  # ClassType
  def class_type_superclass(clazz)
    pl = ''
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    send(3, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    superclass = pl[i,8].unpack("NN"); i += 8
    superclass = superclass[0] << 32 | superclass[1]
    return superclass
  end

  def class_type_set_values(clazz, values)
    pl = ''
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    raise "values must be an Array" if !values.is_a?(Array)
    pl += [values.size].pack("N")
    values.each do |field_id|
      raise "field_id must be a Integer" if !field_id.is_a?(Integer)
      pl += [field_id>>32, field_id&0xffffffff].pack("NN")
    end
    send(3, 2, pl)

    resp = recv_id
  end

  def class_type_invoke_method(clazz, thread, method_id, arguments, options)
    pl = ''
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    raise "arguments must be an Array" if !arguments.is_a?(Array)
    pl += [arguments.size].pack("N")
    arguments.each do |arg|
      raise "arg must be a TaggedValue" if !arg.is_a?(TaggedValue)
      pl += encode_value(arg)
    end
    raise "options must be a Integer" if !options.is_a?(Integer)
    pl += [options].pack("N")
    send(3, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    return_value, i = decode_value(pl, i)
    exception, i = decode_value(pl, i)
    return [return_value, exception]
  end

  def class_type_new_instance(clazz, thread, method_id, arguments, options)
    pl = ''
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    raise "arguments must be an Array" if !arguments.is_a?(Array)
    pl += [arguments.size].pack("N")
    arguments.each do |arg|
      raise "arg must be a TaggedValue" if !arg.is_a?(TaggedValue)
      pl += encode_value(arg)
    end
    raise "options must be a Integer" if !options.is_a?(Integer)
    pl += [options].pack("N")
    send(3, 4, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    new_object, i = decode_value(pl, i)
    exception, i = decode_value(pl, i)
    return [new_object, exception]
  end

  # ArrayType
  def array_type_new_instance(arr_type, length)
    pl = ''
    raise "arr_type must be a Integer" if !arr_type.is_a?(Integer)
    pl += [arr_type>>32, arr_type&0xffffffff].pack("NN")
    raise "length must be a Integer" if !length.is_a?(Integer)
    pl += [length].pack("N")
    send(4, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    new_array, i = decode_value(pl, i)
    return new_array
  end

  # InterfaceType
  def interface_type_invoke_method(clazz, thread, method_id, arguments, options)
    pl = ''
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    raise "arguments must be an Array" if !arguments.is_a?(Array)
    pl += [arguments.size].pack("N")
    arguments.each do |arg|
      raise "arg must be a TaggedValue" if !arg.is_a?(TaggedValue)
      pl += encode_value(arg)
    end
    raise "options must be a Integer" if !options.is_a?(Integer)
    pl += [options].pack("N")
    send(5, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    return_value, i = decode_value(pl, i)
    exception, i = decode_value(pl, i)
    return [return_value, exception]
  end

  # Method
  def method_line_table(ref_type, method_id)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    send(6, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    start = pl[i,8].unpack("NN"); i += 8
    start = start[0] << 32 | start[1]
    end_ = pl[i,8].unpack("NN"); i += 8
    end_ = end_[0] << 32 | end_[1]
    lines = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      line_code_index = pl[i,8].unpack("NN"); i += 8
      line_code_index = line_code_index[0] << 32 | line_code_index[1]
      line_number = pl[i,4].unpack("N")[0]; i += 4
      lines << [line_code_index, line_number]
    end
    return [start, end_, lines]
  end

  def method_variable_table(ref_type, method_id)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    send(6, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    arg_cnt = pl[i,4].unpack("N")[0]; i += 4
    slots = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      code_index = pl[i,8].unpack("NN"); i += 8
      code_index = code_index[0] << 32 | code_index[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      length = pl[i,4].unpack("N")[0]; i += 4
      slot = pl[i,4].unpack("N")[0]; i += 4
      slots << [code_index, name, signature, length, slot]
    end
    return [arg_cnt, slots]
  end

  def method_bytecodes(ref_type, method_id)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    send(6, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    bytes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      bytecode = pl[i,1].unpack("c")[0]; i += 1
      bytes << bytecode
    end
    return bytes
  end

  def method_is_obsolete(ref_type, method_id)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    send(6, 4, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    raise "is_obsolete (boolean) is not implemented yet"
    return is_obsolete
  end

  def method_variable_table_with_generic(ref_type, method_id)
    pl = ''
    raise "ref_type must be a Integer" if !ref_type.is_a?(Integer)
    pl += [ref_type>>32, ref_type&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    send(6, 5, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    arg_cnt = pl[i,4].unpack("N")[0]; i += 4
    slots = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      code_index = pl[i,8].unpack("NN"); i += 8
      code_index = code_index[0] << 32 | code_index[1]
      sz = pl[i,4].unpack("N")[0]; i += 4
      name = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      signature = pl[i,sz]; i += sz
      sz = pl[i,4].unpack("N")[0]; i += 4
      generic_signature = pl[i,sz]; i += sz
      length = pl[i,4].unpack("N")[0]; i += 4
      slot = pl[i,4].unpack("N")[0]; i += 4
      slots << [code_index, name, signature, generic_signature, length, slot]
    end
    return [arg_cnt, slots]
  end

  # Field
  # ObjectReference
  def object_reference_reference_type(object)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    send(9, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
    type_id = pl[i,8].unpack("NN"); i += 8
    type_id = type_id[0] << 32 | type_id[1]
    return [ref_type_tag, type_id]
  end

  def object_reference_get_values(object, fields)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    raise "fields must be an Array" if !fields.is_a?(Array)
    pl += [fields.size].pack("N")
    fields.each do |field_id|
      raise "field_id must be a Integer" if !field_id.is_a?(Integer)
      pl += [field_id>>32, field_id&0xffffffff].pack("NN")
    end
    send(9, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    values = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      value, i = decode_value(pl, i)
      values << value
    end
    return values
  end

  def object_reference_set_values(object, values)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    raise "values must be an Array" if !values.is_a?(Array)
    pl += [values.size].pack("N")
    values.each do |field_id|
      raise "field_id must be a Integer" if !field_id.is_a?(Integer)
      pl += [field_id>>32, field_id&0xffffffff].pack("NN")
    end
    send(9, 3, pl)

    resp = recv_id
  end

  def object_reference_monitor_info(object)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    send(9, 5, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    owner = pl[i,8].unpack("NN"); i += 8
    owner = owner[0] << 32 | owner[1]
    entry_count = pl[i,4].unpack("N")[0]; i += 4
    waiters = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      thread = pl[i,8].unpack("NN"); i += 8
      thread = thread[0] << 32 | thread[1]
      waiters << thread
    end
    return [owner, entry_count, waiters]
  end

  def object_reference_invoke_method(object, thread, clazz, method_id, arguments, options)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "clazz must be a Integer" if !clazz.is_a?(Integer)
    pl += [clazz>>32, clazz&0xffffffff].pack("NN")
    raise "method_id must be a Integer" if !method_id.is_a?(Integer)
    pl += [method_id>>32, method_id&0xffffffff].pack("NN")
    raise "arguments must be an Array" if !arguments.is_a?(Array)
    pl += [arguments.size].pack("N")
    arguments.each do |arg|
      raise "arg must be a TaggedValue" if !arg.is_a?(TaggedValue)
      pl += encode_value(arg)
    end
    raise "options must be a Integer" if !options.is_a?(Integer)
    pl += [options].pack("N")
    send(9, 6, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    return_value, i = decode_value(pl, i)
    exception, i = decode_value(pl, i)
    return [return_value, exception]
  end

  def object_reference_disable_collection(object)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    send(9, 7, pl)

    resp = recv_id
  end

  def object_reference_enable_collection(object)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    send(9, 8, pl)

    resp = recv_id
  end

  def object_reference_is_collected(object)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    send(9, 9, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    raise "is_collected (boolean) is not implemented yet"
    return is_collected
  end

  def object_reference_referring_objects(object, max_referrers)
    pl = ''
    raise "object must be a Integer" if !object.is_a?(Integer)
    pl += [object>>32, object&0xffffffff].pack("NN")
    raise "max_referrers must be a Integer" if !max_referrers.is_a?(Integer)
    pl += [max_referrers].pack("N")
    send(9, 10, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    referring_objects = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      instance, i = decode_value(pl, i)
      referring_objects << instance
    end
    return referring_objects
  end

  # StringReference
  def string_reference_value(string_object)
    pl = ''
    raise "string_object must be a Integer" if !string_object.is_a?(Integer)
    pl += [string_object>>32, string_object&0xffffffff].pack("NN")
    send(10, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    string_value = pl[i,sz]; i += sz
    return string_value
  end

  # ThreadReference
  def thread_reference_name(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    thread_name = pl[i,sz]; i += sz
    return thread_name
  end

  def thread_reference_suspend(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 2, pl)

    resp = recv_id
  end

  def thread_reference_resume(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 3, pl)

    resp = recv_id
  end

  def thread_reference_status(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 4, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    thread_status = pl[i,4].unpack("N")[0]; i += 4
    suspend_status = pl[i,4].unpack("N")[0]; i += 4
    return [thread_status, suspend_status]
  end

  def thread_reference_thread_group(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 5, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    group = pl[i,8].unpack("NN"); i += 8
    group = group[0] << 32 | group[1]
    return group
  end

  def thread_reference_frames(thread, start_frame, length)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "start_frame must be a Integer" if !start_frame.is_a?(Integer)
    pl += [start_frame].pack("N")
    raise "length must be a Integer" if !length.is_a?(Integer)
    pl += [length].pack("N")
    send(11, 6, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    frames = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      frame_id = pl[i,8].unpack("NN"); i += 8
      frame_id = frame_id[0] << 32 | frame_id[1]
      location = pl[i,1+8+8+8]; i += 1+8+8+8
      frames << [frame_id, location]
    end
    return frames
  end

  def thread_reference_frame_count(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 7, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    frame_count = pl[i,4].unpack("N")[0]; i += 4
    return frame_count
  end

  def thread_reference_owned_monitors(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 8, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    owned = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      monitor, i = decode_value(pl, i)
      owned << monitor
    end
    return owned
  end

  def thread_reference_current_contended_monitor(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 9, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    monitor, i = decode_value(pl, i)
    return monitor
  end

  def thread_reference_stop(thread, throwable)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "throwable must be a Integer" if !throwable.is_a?(Integer)
    pl += [throwable>>32, throwable&0xffffffff].pack("NN")
    send(11, 10, pl)

    resp = recv_id
  end

  def thread_reference_interrupt(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 11, pl)

    resp = recv_id
  end

  def thread_reference_suspend_count(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 12, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    suspend_count = pl[i,4].unpack("N")[0]; i += 4
    return suspend_count
  end

  def thread_reference_owned_monitors_stack_depth_info(thread)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    send(11, 13, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    owned = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      monitor, i = decode_value(pl, i)
      stack_depth = pl[i,4].unpack("N")[0]; i += 4
      owned << [monitor, stack_depth]
    end
    return owned
  end

  def thread_reference_force_early_return(thread, value)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "value must be a TaggedValue" if !value.is_a?(TaggedValue)
    pl += encode_value(value)
    send(11, 14, pl)

    resp = recv_id
  end

  # ThreadGroupReference
  def thread_group_reference_name(group)
    pl = ''
    raise "group must be a Integer" if !group.is_a?(Integer)
    pl += [group>>32, group&0xffffffff].pack("NN")
    send(12, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    sz = pl[i,4].unpack("N")[0]; i += 4
    group_name = pl[i,sz]; i += sz
    return group_name
  end

  def thread_group_reference_parent(group)
    pl = ''
    raise "group must be a Integer" if !group.is_a?(Integer)
    pl += [group>>32, group&0xffffffff].pack("NN")
    send(12, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    parent_group = pl[i,8].unpack("NN"); i += 8
    parent_group = parent_group[0] << 32 | parent_group[1]
    return parent_group
  end

  def thread_group_reference_children(group)
    pl = ''
    raise "group must be a Integer" if !group.is_a?(Integer)
    pl += [group>>32, group&0xffffffff].pack("NN")
    send(12, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    child_threads = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      child_thread = pl[i,8].unpack("NN"); i += 8
      child_thread = child_thread[0] << 32 | child_thread[1]
      child_threads << child_thread
    end
    child_groups = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      child_group = pl[i,8].unpack("NN"); i += 8
      child_group = child_group[0] << 32 | child_group[1]
      child_groups << child_group
    end
    return [child_threads, child_groups]
  end

  # ArrayReference
  def array_reference_length(array_object)
    pl = ''
    raise "array_object must be a Integer" if !array_object.is_a?(Integer)
    pl += [array_object>>32, array_object&0xffffffff].pack("NN")
    send(13, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    array_length = pl[i,4].unpack("N")[0]; i += 4
    return array_length
  end

  def array_reference_get_values(array_object, first_index, length)
    pl = ''
    raise "array_object must be a Integer" if !array_object.is_a?(Integer)
    pl += [array_object>>32, array_object&0xffffffff].pack("NN")
    raise "first_index must be a Integer" if !first_index.is_a?(Integer)
    pl += [first_index].pack("N")
    raise "length must be a Integer" if !length.is_a?(Integer)
    pl += [length].pack("N")
    send(13, 2, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    raise "values (arrayregion) is not implemented yet"
    return values
  end

  def array_reference_set_values(array_object, first_index, values)
    pl = ''
    raise "array_object must be a Integer" if !array_object.is_a?(Integer)
    pl += [array_object>>32, array_object&0xffffffff].pack("NN")
    raise "first_index must be a Integer" if !first_index.is_a?(Integer)
    pl += [first_index].pack("N")
    raise "values must be an Array" if !values.is_a?(Array)
    pl += [values.size].pack("N")
    values.each do ||
    end
    send(13, 3, pl)

    resp = recv_id
  end

  # ClassLoaderReference
  def class_loader_reference_visible_classes(class_loader_object)
    pl = ''
    raise "class_loader_object must be a Integer" if !class_loader_object.is_a?(Integer)
    pl += [class_loader_object>>32, class_loader_object&0xffffffff].pack("NN")
    send(14, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    classes = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
      type_id = pl[i,8].unpack("NN"); i += 8
      type_id = type_id[0] << 32 | type_id[1]
      classes << [ref_type_tag, type_id]
    end
    return classes
  end

  # EventRequest
  def event_request_set(event_kind, suspend_policy, modifiers)
    pl = ''
    raise "event_kind must be a Integer" if !event_kind.is_a?(Integer)
    pl += [event_kind].pack("c")
    raise "suspend_policy must be a Integer" if !suspend_policy.is_a?(Integer)
    pl += [suspend_policy].pack("c")
    raise "modifiers must be an Array" if !modifiers.is_a?(Array)
    pl += [modifiers.size].pack("N")
    modifiers.each do |mod_kind|
      raise "mod_kind must be an Array" if !mod_kind.is_a?(Array)
      pl += [mod_kind[0]].pack("c")
      case_values = mod_kind[1..-1]
      case mod_kind[0]
      when 1 # Count
        count, _ = case_values
        raise "count must be a Integer" if !count.is_a?(Integer)
        pl += [count].pack("N")
      when 2 # Conditional
        expr_id, _ = case_values
        raise "expr_id must be a Integer" if !expr_id.is_a?(Integer)
        pl += [expr_id].pack("N")
      when 3 # ThreadOnly
        thread, _ = case_values
        raise "thread must be a Integer" if !thread.is_a?(Integer)
        pl += [thread>>32, thread&0xffffffff].pack("NN")
      when 4 # ClassOnly
        clazz, _ = case_values
        raise "clazz must be a Integer" if !clazz.is_a?(Integer)
        pl += [clazz>>32, clazz&0xffffffff].pack("NN")
      when 5 # ClassMatch
        class_pattern, _ = case_values
        raise "class_pattern must be a String" if !class_pattern.is_a?(String)
        pl += [class_pattern.size].pack("N") + class_pattern
      when 6 # ClassExclude
        class_pattern, _ = case_values
        raise "class_pattern must be a String" if !class_pattern.is_a?(String)
        pl += [class_pattern.size].pack("N") + class_pattern
      when 7 # LocationOnly
        loc, _ = case_values
        raise "loc (location) is not implemented yet"
      when 8 # ExceptionOnly
        exception_or_null, caught, uncaught, _ = case_values
        raise "exception_or_null must be a Integer" if !exception_or_null.is_a?(Integer)
        pl += [exception_or_null>>32, exception_or_null&0xffffffff].pack("NN")
        raise "caught (boolean) is not implemented yet"
        raise "uncaught (boolean) is not implemented yet"
      when 9 # FieldOnly
        declaring, field_id, _ = case_values
        raise "declaring must be a Integer" if !declaring.is_a?(Integer)
        pl += [declaring>>32, declaring&0xffffffff].pack("NN")
        raise "field_id must be a Integer" if !field_id.is_a?(Integer)
        pl += [field_id>>32, field_id&0xffffffff].pack("NN")
      when 10 # Step
        thread, size, depth, _ = case_values
        raise "thread must be a Integer" if !thread.is_a?(Integer)
        pl += [thread>>32, thread&0xffffffff].pack("NN")
        raise "size must be a Integer" if !size.is_a?(Integer)
        pl += [size].pack("N")
        raise "depth must be a Integer" if !depth.is_a?(Integer)
        pl += [depth].pack("N")
      when 11 # InstanceOnly
        instance, _ = case_values
        raise "instance must be a Integer" if !instance.is_a?(Integer)
        pl += [instance>>32, instance&0xffffffff].pack("NN")
      when 12 # SourceNameMatch
        source_name_pattern, _ = case_values
        raise "source_name_pattern must be a String" if !source_name_pattern.is_a?(String)
        pl += [source_name_pattern.size].pack("N") + source_name_pattern
      else
        raise "Unknown mod_kind: #{mod_kind[0]}"
      end
    end
    send(15, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    request_id = pl[i,4].unpack("N")[0]; i += 4
    return request_id
  end

  def event_request_clear(event_kind, request_id)
    pl = ''
    raise "event_kind must be a Integer" if !event_kind.is_a?(Integer)
    pl += [event_kind].pack("c")
    raise "request_id must be a Integer" if !request_id.is_a?(Integer)
    pl += [request_id].pack("N")
    send(15, 2, pl)

    resp = recv_id
  end

  def event_request_clear_all_breakpoints()
    pl = ''
    send(15, 3, pl)

    resp = recv_id
  end

  # StackFrame
  def stack_frame_get_values(thread, frame, slots)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "frame must be a Integer" if !frame.is_a?(Integer)
    pl += [frame>>32, frame&0xffffffff].pack("NN")
    raise "slots must be an Array" if !slots.is_a?(Array)
    pl += [slots.size].pack("N")
    slots.each do |slot, sigbyte|
      raise "slot must be a Integer" if !slot.is_a?(Integer)
      pl += [slot].pack("N")
      raise "sigbyte must be a Integer" if !sigbyte.is_a?(Integer)
      pl += [sigbyte].pack("c")
    end
    send(16, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    values = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      slot_value, i = decode_value(pl, i)
      values << slot_value
    end
    return values
  end

  def stack_frame_set_values(thread, frame, slot_values)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "frame must be a Integer" if !frame.is_a?(Integer)
    pl += [frame>>32, frame&0xffffffff].pack("NN")
    raise "slot_values must be an Array" if !slot_values.is_a?(Array)
    pl += [slot_values.size].pack("N")
    slot_values.each do |slot, slot_value|
      raise "slot must be a Integer" if !slot.is_a?(Integer)
      pl += [slot].pack("N")
      raise "slot_value must be a TaggedValue" if !slot_value.is_a?(TaggedValue)
      pl += encode_value(slot_value)
    end
    send(16, 2, pl)

    resp = recv_id
  end

  def stack_frame_this_object(thread, frame)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "frame must be a Integer" if !frame.is_a?(Integer)
    pl += [frame>>32, frame&0xffffffff].pack("NN")
    send(16, 3, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    object_this, i = decode_value(pl, i)
    return object_this
  end

  def stack_frame_pop_frames(thread, frame)
    pl = ''
    raise "thread must be a Integer" if !thread.is_a?(Integer)
    pl += [thread>>32, thread&0xffffffff].pack("NN")
    raise "frame must be a Integer" if !frame.is_a?(Integer)
    pl += [frame>>32, frame&0xffffffff].pack("NN")
    send(16, 4, pl)

    resp = recv_id
  end

  # ClassObjectReference
  def class_object_reference_reflected_type(class_object)
    pl = ''
    raise "class_object must be a Integer" if !class_object.is_a?(Integer)
    pl += [class_object>>32, class_object&0xffffffff].pack("NN")
    send(17, 1, pl)

    resp = recv_id
    pl = resp.pl
    i = 0
    ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
    type_id = pl[i,8].unpack("NN"); i += 8
    type_id = type_id[0] << 32 | type_id[1]
    return [ref_type_tag, type_id]
  end

  # Event
  def parse_event_composite(pl)
    i = 0
    suspend_policy = pl[i,1].unpack("c")[0]; i += 1
    events = []
    sz = pl[i,4].unpack("N")[0]; i += 4
    sz.times do
      event_kind = pl[i,1].unpack("c"); i += 1
      case event_kind[0]
      when EventKind::VM_START # VMStart
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        event_kind += [request_id, thread]
      when EventKind::SINGLE_STEP # SingleStep
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, location]
      when EventKind::BREAKPOINT # Breakpoint
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, location]
      when EventKind::METHOD_ENTRY # MethodEntry
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, location]
      when EventKind::METHOD_EXIT # MethodExit
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, location]
      when EventKind::METHOD_EXIT_WITH_RETURN_VALUE # MethodExitWithReturnValue
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        value, i = decode_value(pl, i)
        event_kind += [request_id, thread, location, value]
      when EventKind::MONITOR_CONTENDED_ENTER # MonitorContendedEnter
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        object, i = decode_value(pl, i)
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, object, location]
      when EventKind::MONITOR_CONTENDED_ENTERED # MonitorContendedEntered
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        object, i = decode_value(pl, i)
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, object, location]
      when EventKind::MONITOR_WAIT # MonitorWait
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        object, i = decode_value(pl, i)
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        timeout = pl[i,8].unpack("NN"); i += 8
        timeout = timeout[0] << 32 | timeout[1]
        event_kind += [request_id, thread, object, location, timeout]
      when EventKind::MONITOR_WAITED # MonitorWaited
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        object, i = decode_value(pl, i)
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        raise "timed_out (boolean) is not implemented yet"
        event_kind += [request_id, thread, object, location, timed_out]
      when EventKind::EXCEPTION # Exception
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        exception, i = decode_value(pl, i)
        catch_location = pl[i,1+8+8+8]; i += 1+8+8+8
        event_kind += [request_id, thread, location, exception, catch_location]
      when EventKind::THREAD_START # ThreadStart
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        event_kind += [request_id, thread]
      when EventKind::THREAD_DEATH # ThreadDeath
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        event_kind += [request_id, thread]
      when EventKind::CLASS_PREPARE # ClassPrepare
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
        type_id = pl[i,8].unpack("NN"); i += 8
        type_id = type_id[0] << 32 | type_id[1]
        sz = pl[i,4].unpack("N")[0]; i += 4
        signature = pl[i,sz]; i += sz
        status = pl[i,4].unpack("N")[0]; i += 4
        event_kind += [request_id, thread, ref_type_tag, type_id, signature, status]
      when EventKind::CLASS_UNLOAD # ClassUnload
        request_id = pl[i,4].unpack("N")[0]; i += 4
        sz = pl[i,4].unpack("N")[0]; i += 4
        signature = pl[i,sz]; i += sz
        event_kind += [request_id, signature]
      when EventKind::FIELD_ACCESS # FieldAccess
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
        type_id = pl[i,8].unpack("NN"); i += 8
        type_id = type_id[0] << 32 | type_id[1]
        field_id = pl[i,8].unpack("NN"); i += 8
        field_id = field_id[0] << 32 | field_id[1]
        object, i = decode_value(pl, i)
        event_kind += [request_id, thread, location, ref_type_tag, type_id, field_id, object]
      when EventKind::FIELD_MODIFICATION # FieldModification
        request_id = pl[i,4].unpack("N")[0]; i += 4
        thread = pl[i,8].unpack("NN"); i += 8
        thread = thread[0] << 32 | thread[1]
        location = pl[i,1+8+8+8]; i += 1+8+8+8
        ref_type_tag = pl[i,1].unpack("c")[0]; i += 1
        type_id = pl[i,8].unpack("NN"); i += 8
        type_id = type_id[0] << 32 | type_id[1]
        field_id = pl[i,8].unpack("NN"); i += 8
        field_id = field_id[0] << 32 | field_id[1]
        object, i = decode_value(pl, i)
        value_to_be, i = decode_value(pl, i)
        event_kind += [request_id, thread, location, ref_type_tag, type_id, field_id, object, value_to_be]
      when EventKind::VM_DEATH # VMDeath
        request_id = pl[i,4].unpack("N")[0]; i += 4
        event_kind += [request_id]
      else
        raise "Unknown event_kind: #{event_kind[0]}"
      end
      events << event_kind
    end
    return [suspend_policy, events]
  end
end
