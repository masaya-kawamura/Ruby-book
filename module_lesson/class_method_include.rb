module Taggable
  def price_tag
    # priceメソッドはinclude先で定義されているはずという前提
    "#{self.price}円"
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
product.price_tag #=> "1000円"