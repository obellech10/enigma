require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require 'pry'

class OffsetTest < MiniTest::Test

  def setup
    @offset = Offset.new("040895")
    @offset_2 = Offset.new
  end

  def test_that_it_exists
    assert_instance_of Offset, @offset
  end

  def test_attributes
    assert_equal "040895", @offset.date
  end

  def test_that_it_can_assign_offsets_to_keys
    expected = {
      a: 1,
      b: 0,
      c: 2,
      d: 5
    }
    assert_equal expected, @offset.assign_offset
  end

  def test_that_it_can_generate_date
    Offset.any_instance.stubs(:generate_date).returns("020619")
    assert_equal "020619", @offset.generate_date
  end

end
