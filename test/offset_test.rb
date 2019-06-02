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

end