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

  def test_it_can_encrypt
    assert_equal "keder ohulw", @convert.cipher([3,27,73,20])
  end

  def test_it_can_encrypt_with_special_char
    convert_2 = Convert.new("Hello! World!")
    assert_equal "keder!sprrdx!", convert_2.cipher([3,27,73,20])
  end

  def test_it_can_decrypt_with_special_char
    convert_2 = Convert.new("keder ohulw!")
    assert_equal "hello world!", convert_2.decipher([3,27,73,20])
  end

end
