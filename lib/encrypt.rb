require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/convert'
require './lib/shift'
require 'pry'


# ruby ./lib/encrypt.rb message.txt encrypted.txt
encrypt = File.open(ARGV[0], "r")
message = encrypt.read
encrypt_msg = Convert.new(message)
# binding.pry
enigma = Enigma.new
cipher = enigma.encrypt(encrypt_msg.message.rstrip, "02715", "040895")

encrypted = File.open(ARGV[1], "w")
encrypted.write(cipher[:decryption])
encrypted.close

p "Created 'encrypted.txt' with the key #{cipher[:key]} and date #{cipher[:date]}"
