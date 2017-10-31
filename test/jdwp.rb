require 'socket'
require 'test/unit'

require 'client'
require 'command'

class TestJDWP < Test::Unit::TestCase

  self.test_order = :defined

  CS_VM = 1
  VM_VERSION = 1
  VM_RESUME = 9

  def setup
    if File.mtime("test/debuggee.class") <= File.mtime("test/debuggee.java")
      if !system("javac test/debuggee.java")
        raise "Failed to compile test/debuggee.java"
      end
    end
  end

  def run_debuggee
    cmd = %w(java -agentlib:jdwp=transport=dt_socket,server=y,address=localhost:8000 -classpath test debuggee)
    pid = spawn(*cmd)

    ok = false
    begin
      sock = nil
      1000.times do
        begin
          sock = TCPSocket.new('localhost', 8000)
          break
        rescue
          sleep 0.001
        end
      end
      assert_not_nil sock

      client = Client.new(sock)
      client.handshake

      yield client

    ensure
      1000.times do
        if Process.waitpid(pid, Process::WNOHANG)
          ok = true
          break
        end
        sleep 0.001
      end

      if !ok
        STDERR.puts "java process did not finish"
        Process.kill(:KILL, pid)
        Process.waitpid(pid, Process::WNOHANG)
      end
    end
    assert_true ok, "java process did not finish"
  end

  def test_jdwp
    run_debuggee do |client|
      p client.recv
      client.send(CS_VM, VM_RESUME)
      p client.recv
    end
  end

  def test_virtual_machine_version
    run_debuggee do |client|
      resp = client.virtual_machine_version
      p resp
      desc, major, minor, vm_version, vm_name = resp
      assert_match /java/i, desc
      client.virtual_machine_resume
    end
  end

  def test_wait_vm_start
    run_debuggee do |client|
      kind, id, tid = client.wait_event
      assert_equal Client::EventKind::VM_START, kind
      assert_equal 1, tid
      client.virtual_machine_resume
    end
  end

  def test_single_step
    run_debuggee do |client|
      event = client.wait_event
      req_id = client.event_request_set(Client::EventKind::SINGLE_STEP,
                                        Client::SuspendPolicy::ALL,
                                        [[1, 1], [10, 1, 0, 0]])  # one-off.
      client.virtual_machine_resume
      kind, id, tid, loc = client.wait_event
      assert_equal Client::EventKind::SINGLE_STEP, kind
      assert_equal req_id, id
      assert_equal 1, tid
      client.virtual_machine_resume
    end
  end

end
