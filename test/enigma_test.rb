require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'mocha/minitest'
require 'date'
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_that_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_that_it_can_encrypt_with_key_date
    message = mock
    message.stubs(:decryption).returns("keder ohulw")
    key = mock
    key.stubs(:key).returns("02715")
    date = mock
    date.stubs(:date).returns("040895")
    # encrypt_message = mock(message, key, date)

    expected = {decryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
