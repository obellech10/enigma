class Shift

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

# Will need to change to output just an array or change how keys are assigned
  def assign_shift
    @key.assign_keys.merge(@offset.assign_offset) do |key_id, keys, shift|
      keys + shift
    end
  end

end
