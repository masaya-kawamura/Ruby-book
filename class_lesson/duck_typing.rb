# class User
#   def name
#     'Alice'
#   end
# end

# class Product
#   def name
#     'A great movie'
#   end
# end

# def display_name(object)
#   "Name is <<#{object.name}>>"
# end

# # UserクラスとProductクラスはお互いに無関係なクラスだが、display_nameメソッドは何も気にしない
# user = User.new
# p display_name(user)

# product = Product.new
# p display_name(product)

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end


  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり' : 'なし'
    "商品名: #{@name} 価格: #{@price}円 在庫: #{stock}"
  end

  def stock?
    # 「サブクラスでstock?メソッドを実装すること」というメッセージとともにエラーを発生させる
    raise 'Must implement stock? in subclass.'
  end
end

class DVD < Product
  #在庫があればtrueを返す
  def stock?
    # （本当はデータベースにと言わせるなどの処理が必要だがここでは省略）
    true
  end
end

product = Product.new('A great film', 1000)
# スーパークラスはstock?メソッドを持たないのでエラーが起きる
p product.display_text #=> エラーになる

dvd = DVD.new('An awesome film', 3000)
# サブクラスはstock?メソッドを持つのでエラーが起きない
p dvd.display_text
