require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/convert'
require './lib/shift'
require 'pry'

decrypt = File.open(ARGV[0], "r")
message = decrypt.read
decrypt_msg = Convert.new(message)

enigma = Enigma.new
decipher = enigma.decrypt(decrypt_msg.message.rstrip, ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], "w")
decrypted.write(decipher[:decryption])
decrypted.close

p "Created 'decrypted.txt' with the key #{decipher[:key]} and date #{decipher[:date]}"
