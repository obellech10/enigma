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
require './lib/shift'
require 'pry'

class ShiftTest < MiniTest::Test

  def setup
    @key_1 = Keys.new("02715")
    @offset = Offset.new("040895")
    @shift = Shift.new(@key_1, @offset)
  end

  def test_that_it_exists
    assert_instance_of Shift, @shift
  end


end
