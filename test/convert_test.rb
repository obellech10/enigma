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
require './lib/convert'
require 'pry'

class ConvertTest < MiniTest::Test

  def setup
    @convert = Convert.new("Hello World")
  end

  def test_that_it_exists
    assert_instance_of Convert, @convert
  end

  def test_attributes
    assert_equal "Hello World", @convert.message
  end
end
