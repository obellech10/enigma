class Enigma

  def encrypt(message, key="", date="")
    encrypt_msg = Convert.new(message)
    key_1 = Keys.new(key)
    date_1 = Offset.new(date)
    shift = Shift.new(key_1, date_1)

    {
      encryption: encrypt_msg.cipher(shift.assign_shift.values),
      key: key_1.key,
      date: date_1.date
    }
  end

  def decrypt(message, key="", date="")
    decrypt_msg = Convert.new(message)
    key_1 = Keys.new(key)
    date_1 = Offset.new(date)
    shift = Shift.new(key_1, date_1)

    {
      decryption: decrypt_msg.decipher(shift.assign_shift.values),
      key: key_1.key,
      date: date_1.date
    }
  end
end
