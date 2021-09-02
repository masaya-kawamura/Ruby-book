# ログ出力ようのメソッドを提供するモジュール
# 「ログ出力できる（log + able）」という意味でLoggableという名前

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # 上で作成したモジュールをincludeする
  include Loggable

  def title
    # logメソッドはLoggableモジュールで定義したメソッド
    log 'title is called.'
    'A great movie'
  end
end

class User
  # Userにも同じくLoggableをinclude
  include Loggable

  def name
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
p product.title
#=> [LOG] title is called.
# "A great movie"

user = User.new
p user.name
#=> [LOG] name is called.
# "Alice"