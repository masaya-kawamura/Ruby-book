# Rubyにはインスタンス自身を表すselfキーワードがある
# メソッドの内部で他のメソッドを呼び出す場合は暗黙的にself（自分自身)に対してメソッドを呼び出している。
# 他のクラスを呼び出す際にはProduct.nameと記述するように自分自身はself.nameのように呼び出すことができる。

class User

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  # selfなしでnameメソッドを呼ぶ
  def hello
    "Hello, I am #{name}"
  end


  def hi
    #self付きでnameメソッドを呼ぶ
    "Hi, I am #{self.name}."
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}"
  end
end

user = User.new('Alice')
puts user.hello
puts user.hi
puts user.my_name
puts user.name

# 上記コードでは、nameもself.nameも@nameも同じ文字列の"Alice"を返す。
# この場合はどれも同じ結果になるので「これが正解」と1つ選ぶことはできない。
# selfを付けたりつけなかったり、このままインスタンス変数にアクセスしたり、人によって書き方が異なる。

# ところが、値をセットするname=（セッター)の場合は異なる

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    #selfなしでname=メソッドを呼ぶ(?)
    name = "Bob"
  end

  def rename_to_carol
    #self付きでname=メソッドを呼ぶ
    self.name = 'Carol'
  end

  def rename_to_dave
    # 直接インスタンス変数を書き換える
    @name = 'Dave'
  end
end

user = User.new('Alice')

# Bobにリネーム...できていない!!
user.rename_to_bob
user.name #=> "Alice"

# Carolにリネーム
user.rename_to_carol
user.name #=> "Carol"

# Daveにリネーム
user.rename_to_dave
user.name #=> "Dave"

# 上記のrename_to_bobメソッドのコードを見るとローカル変数に値を格納する動作と同じになっており、そのように解釈される。
# そのため、name=のようなセッターメソッドを呼び出したい場合は必ずselfをつける必要がある。

# ◆ クラスメソッドやクラス構文直下のself
# クラス定義内に登場するselfは場所によって「そのクラスのインスタンス自身を表したり、「クラス自身」を表したりする。

class Foo
  puts "クラス構文の直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end
# クラス構文の直下のself: Foo

Foo.bar 
#=> クラス構文内のself: Foo

foo = Foo.new
foo.baz
#=> インスタンスメソッドの内のself: #<Foo:0x007f9d7c046>

# クラス構文直下とクラスメソッド内のselfは両方ともクラス自身を表すが、インスタンスメソッド内のselfはインスタンスメソッド自身を表す。
# よって次のようなコードはエラーになる。

class Foo
  def self.bar
    #クラスメソッドからインスタンスメソッドを呼び出す(エラー)
    self.baz
  end

  def baz
    #インスタンスメソッドからクラスメソッドを呼び出す（エラー)
    self.bar
  end
end

Foo.bar #=> エラー

foo = Foo.new
foo.baz #=> エラー

# クラス構文直下からクラスメソッドを呼び出すことはできるが、クラスメソッドを定義した後に呼び出す必要がある。

class Foo
  def self.bar
    puts 'hello'
  end

  self.bar
end

# クラスメソッドをインスタンスメソッドの内部から呼び出す場合は下記のように記述する

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # def name
  #   @name
  # end

  # def price
  #   @price
  # end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
puts product.to_s #=> name: A great movie, price: 1000円