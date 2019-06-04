class Convert
  attr_reader :message

  def initialize(message)
    @message = message
    @alphabet = ("a".."z").to_a << " "
  end

  def cipher(shift)
    encrypted_word = ""
    @message.downcase.each_char.with_index do |char, i|
      if !@alphabet.include?(char)
        encrypted_word << char
      else
        key = shift[i % shift.length]
        if key <= 27
          shifted_alpha = @alphabet[key..-1] + @alphabet[0...key]
        else
          adj_key = key % 27
          shifted_alpha = @alphabet[adj_key..-1] + @alphabet[0...adj_key]
        end
          encrypted_word << shifted_alpha[@alphabet.index(char)]
      end
    end
    encrypted_word
  end

  def decipher(shift)
    decrypted_word = ""
    @message.downcase.each_char.with_index do |char, i|
      if !@alphabet.include?(char)
        decrypted_word << char
      else
        key = shift[i % shift.length]
        if key <= 27
          shifted_alpha = @alphabet[0...key] + @alphabet[key..-1]
          decrypted_word << shifted_alpha[@alphabet.index(char)-key]
        else
          adj_key = key % 27
          shifted_alpha = @alphabet[0...adj_key] + @alphabet[adj_key..-1]
          decrypted_word << shifted_alpha[@alphabet.index(char)-adj_key]
        end
      end
    end
    decrypted_word
  end
end
