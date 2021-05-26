# class Product
#   #デフォルトの価格を定数として定義する
#   DEFAULT_PRICE = 0
#   #読み取り専用
#   attr_reader :name, :price

#   def initialize(name, price = DEFAULT_PRICE)
#     @name = name
#     @price = price
#   end
# end

# product = Product.new('A free movie')
# puts product.price


class Product
  DEFAULT_PRICE = 0

  def self.default_price
    #クラスメソッドから定数を参照する
    DEFAULT_PRICE
  end

  def default_price
    #インスタンスメソッドから定数を参照する
    DEFAULT_PRICE
  end
end

puts Product.default_price

product = Product.new
puts product.default_price