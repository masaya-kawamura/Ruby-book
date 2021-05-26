require './Product'

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name,price)
    @running_time = running_time
  end

  def to_s
    "#{super},running_time: #{running_time}"
  end
end

dvd = DVD.new('A great movie', 3000, 120)
puts dvd.to_s