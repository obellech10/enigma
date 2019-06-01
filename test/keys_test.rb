require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/keys'
require 'pry'

class KeysTest < MiniTest::Test

  def setup
    @key_1 = Keys.new
  end

  def test_that_it_exists
    assert_instance_of Keys, @key_1
  end

  def test_it_can_assign_values_to_keys
    expected = {
      a_key: 2,
      b_key: 27,
      c_key: 71,
      d_key: 15
    }
    assert_equal expected, @key_1.assign_keys("02715")
  end
end
