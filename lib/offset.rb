require 'date'

class Offset
  attr_reader :date

  def initialize(date="")
    @date = date
  end

  def assign_offset
    # can add conditional here to check for a given date, if no date,
    # assign todays date to @date and then call on squared_date method
    generate_date if @date == ""
    offset_values = Hash.new(0)
    squared_date

    offset_values[:a] = squared_date.byteslice(0).to_i
    offset_values[:b] = squared_date.byteslice(1).to_i
    offset_values[:c] = squared_date.byteslice(2).to_i
    offset_values[:d] = squared_date.byteslice(3).to_i
    offset_values
  end

  def squared_date
    ((@date.to_i * @date.to_i).to_s).slice(-4..-1)
  end

  def generate_date
    @date = Date.today.strftime("%d%m%y")
  end
end
