class Keys
  attr_reader :key

  def initialize(key="")
    @key = key
  end

  def assign_keys
    generate_key if @key == ""
    
    key_values = {
      a: 0,
      b: 0,
      c: 0,
      d: 0
    }

    key_values[:a] = (@key.byteslice(0) + @key.byteslice(1)).to_i
    key_values[:b] = (@key.byteslice(1) + @key.byteslice(2)).to_i
    key_values[:c] = (@key.byteslice(2) + @key.byteslice(3)).to_i
    key_values[:d] = (@key.byteslice(3) + @key.byteslice(4)).to_i

    key_values
  end

  def generate_key
    random_key = ""
    5.times { |num| random_key << (rand(10)).to_s}
    @key = random_key
  end

end
