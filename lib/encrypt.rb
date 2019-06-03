require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/convert'
require './lib/shift'
require 'pry'

encrypt = File.open(ARGV[0], "r")
message = encrypt.read
encrypt_msg = Convert.new(message)

enigma = Enigma.new
cipher = enigma.encrypt(encrypt_msg.message.rstrip)

encrypted = File.open(ARGV[1], "w")
encrypted.write(cipher[:decryption])
encrypted.close

p "Created 'encrypted.txt' with the key #{cipher[:key]} and date #{cipher[:date]}"
