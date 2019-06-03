require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/keys'
require './lib/shift'
require 'pry'

class KeysTest < MiniTest::Test

  def setup
    @key_1 = Keys.new("02715")
    @key_2 = Keys.new
  end

  def test_that_it_exists
    assert_instance_of Keys, @key_1
  end

  def test_attributes
    assert_equal "02715", @key_1.key
  end

  def test_it_can_assign_values_to_keys
    expected = {
      a: 2,
      b: 27,
      c: 71,
      d: 15
    }
    assert_equal expected, @key_1.assign_keys
  end

  def test_it_can_generate_random_key
    Keys.any_instance.stubs(:generate_key).returns("04672")
    assert_equal "04672", @key_2.generate_key
  end
end
