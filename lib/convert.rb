class Convert
  attr_reader :message

  def initialize(message)
    @message = message
    @alphabet = ("a".."z").to_a << " "
  end

  def cipher(shift)
    encrypted_word = ""
    @message.downcase.each_char.with_index do |char, i|
      key = shift[i % shift.length]
      if key <= 27
        shifted_alpha = @alphabet[key..-1] + @alphabet[0...key]
      else
        adj_key = key % 27
        shifted_alpha = @alphabet[adj_key..-1] + @alphabet[0...adj_key]
      end
      encrypted_word << shifted_alpha[@alphabet.index(char)]
    end
    encrypted_word
  end

  def decipher(shift)
    decrypted_word = ""
    @message.downcase.each_char.with_index do |char, i|
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
    decrypted_word
  end

  # def cipher(shift)
  #   encrypted_word = ""
  #   @message.downcase.each_char.with_index do |char, i|
  #     key = shift[i % shift.length]
  #     index = LETTER_TO_INDEX[char]
  #     if (key + index) <= 27
  #       encrypted_word << INDEX_TO_LETTER[index + key]
  #     else
  #       adj_key = (key + index) % 27
  #       encrypted_word << INDEX_TO_LETTER[adj_key]
  #     end
  #   end
  #   encrypted_word
  # end


# INDEX_TO_LETTER = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g",
#                   7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n",
#                   14=>"o", 15=>"p", 16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u",
#                   21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z", 26=>" "}
# LETTER_TO_INDEX = {"a"=>0,"b"=> 1,"c"=> 2,"d"=> 3,"e"=> 4,"f"=> 5,"g"=> 6,
#                   "h"=> 7,"i"=> 8,"j"=> 9, "k"=>10, "l"=>11, "m"=>12, "n"=>13,
#                   "o"=>14, "p"=>15, "q"=>16,"r"=>17, "s"=>18, "t"=>19, "u"=>20,
#                   "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}
end
