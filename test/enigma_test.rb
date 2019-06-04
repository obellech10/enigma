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
    @key = Keys.new
    @offset = Offset.new
  end

  def test_that_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_that_it_can_encrypt_with_key_date
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, @enigma.encrypt("Hello World", "02715", "040895")
  end

  def test_that_it_can_encrypt_with_key_no_date
    Offset.any_instance.stubs(:date).returns("020619")
    expected = {encryption: "mfhatasdwm ",
      key: "02715",
      date: "020619"}
      assert_equal expected, @enigma.encrypt("Hello World", "02715")
  end

  def test_that_it_can_encrypt_with_no_key_no_date
    Keys.any_instance.stubs(:key).returns("04672")
    Offset.any_instance.stubs(:date).returns("020619")
    @shift = Shift.new("04672",{
      a: 1,
      b: 0,
      c: 2,
      d: 5
    })
    Shift.any_instance.stubs(:assign_shift).returns({
      a: 3,
      b: 1,
      c: 6,
      d: 1
    })

    expected = {encryption: "kfrmrabpumj",
      key: "04672",
      date: "020619"}
      assert_equal expected, @enigma.encrypt("Hello World")
  end

  def test_that_it_can_decrypt_with_key_date
    expected = {decryption: "hello world",
      key: "02715",
      date: "040895"}
      assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_that_it_can_decrypt_with_key_no_date
    Offset.any_instance.stubs(:date).returns("020619")
    expected = {decryption: "hello world",
      key: "02715",
      date: "020619"}
      assert_equal expected, @enigma.decrypt("mfhatasdwm ", "02715")
  end

end
