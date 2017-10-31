require 'socket'
require 'test/unit'

require 'java'

class TestJava < Test::Unit::TestCase

  self.test_order = :defined

  def test_init_types
    Java::start('debuggee', 'test') do
      assert_not_nil Java::java.lang
      assert_not_nil Java::java.lang.System
      assert_not_nil Java::java.lang.String
      assert_not_nil Java::java.io.File
    end
  end

  def test_static_methods
    Java::start('debuggee', 'test') do
      java = Java::java
      assert_not_nil java.io.File.new('foo')
      assert_equal 'true', java.lang.String.valueOf(true)
      assert_equal '4.2', java.lang.String.valueOf(4.2)
      assert_equal '42', java.lang.String.valueOf(42)
    end
  end

  def test_instance_methods
    Java::start('debuggee', 'test') do
      java = Java::java
      file = java.io.File.new('foo//bar')
      assert_equal 'foo/bar', file.toString
      assert_equal 'foo', file.getParentFile.toString
    end
  end

end
