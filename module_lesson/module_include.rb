class Product
  def title
    log 'title is called.' 
    'A great movie'
  end

  private

  def log(text)
    #本来であれば標準ライブラリのLoggerクラスなどを使うべきだが、簡易的にputsで済ませる
    puts "[LOG] #{text}"
  end
end


class User
  def name
    log 'name is called.' 
    'Alice'
  end

  private

  # このメソッドの実装はProductクラスのlogメソッドと全く同じ
  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
product.title 
#=> [LOG] title is called.
# "A great movie"

user = User.new
user.name
#=> [LOG] name is called.
# "Alice"
