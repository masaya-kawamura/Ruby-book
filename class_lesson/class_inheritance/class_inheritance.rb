class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
# product = Product.new('A great movie', 1000)
# puts product.name
# puts product.price

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

dvd = DVD.new('A great movie', 1000, 120)
puts dvd.name
puts dvd.price
puts dvd.running_time


# クラスを継承するとメソッドも継承される

class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

puts Foo.hello #=> hello
puts Bar.hello #=> hello

