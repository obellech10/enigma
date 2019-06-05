class Keys
  attr_reader :key

  def initialize(key="")
    @key = key
    generate_key if @key == ""
  end

  def assign_keys
    key_values = Hash.new(0)

    key_values[:a] = (@key.byteslice(0) + @key.byteslice(1)).to_i
    key_values[:b] = (@key.byteslice(1) + @key.byteslice(2)).to_i
    key_values[:c] = (@key.byteslice(2) + @key.byteslice(3)).to_i
    key_values[:d] = (@key.byteslice(3) + @key.byteslice(4)).to_i

    key_values
  end

  def generate_key
    5.times { |num| @key << (rand(10)).to_s}
  end

end
