# private
# レシーバを指定して呼び出すことができないメソッド。
# user.helloと書いた場合には、userがhelloメソッドのレシーバになる。
#しかしhelloメソッドがprivateメソッドメソッドであればレシーバが指定できないので、user.helloのように呼び出すとエラーになる。

class User

  private

  def hello
    'Hello!'
  end
end

user = User.new
user.hello #=> エラーになる

class User

  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight
  end

  def greeting
    puts "私は#{name}と申します"
    if weight <= 60
      puts "体型は痩せ型です"
    else
      puts "標準よリは大きな体をしています"
    end
  end

  private
    
  def weight
    @weight
  end

end

bob = User.new('Bob', 70)
bob.greeting
#=> 私はBobと申します。
#=> 標準よりは大きな体をしています

# protected
# メソッドを定義したクラス自身と。そのサブクラスのインスタンスメソッドからレシーバ付きで呼び出せる。

class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  def weight
    @weight
  end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

# 同じクラスのインスタンスメソッドないであればweightが呼び出せる
alice.heavier_than?(bob) #=> false
bob.heavier_than?(alice) #=> true
# クラスの外ではweightは呼び出せない
alice.weight #=> エラーになる