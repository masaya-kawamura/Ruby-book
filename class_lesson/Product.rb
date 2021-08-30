class Product
  #デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0
  UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end

  def self.default_price
    #クラスメソッドから定数を参照する
    DEFAULT_PRICE
  end

end

  product = Product.new('A free movie')
  puts product.price
