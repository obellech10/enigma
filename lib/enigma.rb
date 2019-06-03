class Enigma
  def encrypt(message, key="", date="")
    shift = Shift.new(key, date)
    {
      decryption: message.cipher(shift.assign_shift.values),
      key: key.key,
      date: date.date
    }
  end
end
