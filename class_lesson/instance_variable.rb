class Product
  #クラスインスタンス変数
  @name = 'Product'

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end
end

Product.name #=> "Product"

product = Product.new('A great movie')
puts product.name #=> "A great movie'
puts Product.name #=> "Product"

class DVD < Product
  @name 'DVD'

  def self.name
    # クラスインスタンス変数を参照
    @name
  end

  def upcase_name
    # インスタンス変数を参照
    @name.upcase
  end
end

puts Product.name #=> "Product"
puts DVD.name #=> "DVD"

product = Product.new('A great movie')
puts product.name #=> A great movie

dvd = DVD.new('An great movie')
dvd.name #=> An awesome film
dvd.upcase_name #=> AN AWESOME FILM

Product.name #=> "Product"
DVD.name #=> "DVD"

