module Loggable
  #省略
end

class Product
  include Loggable
  # 省略
end

# 引数で渡したmoduleがincludeされているかを調べる
p Product.include?(Loggable) #=> true

# includeされているmoduleの一覧を配列で取得する
p Product.included_modules
#=> [Loggable, Kernel]

# スーパークラスも含めてincludeされたmoduleの情報取得
p Product.ancestors #=> [Product, Laggable, Object, Kernel, BasicObject]

# クラスではなく、インスタンスからincludeされているモジュールの情報を取得する。
product = Product.new
# product.classはProductクラスを返す
product.class.include?(Loggable) #=> true
product.class.included_modules #=> [Loggable, Kernel]

# is_aメソッドを使って、直接インスタンスに対してそのモジュールをincludeしているかどうかを調べる
product.is_a?(Product) #=> true
product.is_a?(Loggable) #=> true
product.is_a?(Object) #=> true