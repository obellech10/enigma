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
require './lib/convert'
require './lib/shift'
require 'pry'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_that_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_that_it_can_encrypt_with_key_date
    expected = {decryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, @enigma.encrypt("Hello World", "02715", "040895")
  end
end
