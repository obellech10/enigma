class Keys
  attr_reader :key
  
  def initialize(key="")
    @key = key
  end

  def assign_keys(key)
    key_values = {
      a_key: 0,
      b_key: 0,
      c_key: 0,
      d_key: 0
    }

    key_values[:a_key] = (key.byteslice(0) + key.byteslice(1)).to_i
    key_values[:b_key] = (key.byteslice(1) + key.byteslice(2)).to_i
    key_values[:c_key] = (key.byteslice(2) + key.byteslice(3)).to_i
    key_values[:d_key] = (key.byteslice(3) + key.byteslice(4)).to_i

    key_values
  end
end
