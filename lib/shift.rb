class Shift

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def assign_shift
    @key.assign_keys.merge(@offset.assign_offset) do |key_id, keys, shift|
      keys + shift
    end  
  end
end
