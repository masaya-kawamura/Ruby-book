# 特異メソッドの例
# 特定のオブジェクトに対してのみにも挙動を変更したりできる。
alice = 'I am Alice.'
bob = 'I am Bob.'

# aliceのオブジェクトにだけ、shuffleメソッドを定義する。
def alice.shuffle
  chars.shuffle.join
end

# 数値シンボルはRubyの実装上の制約により、特異メソッドを定義できない。
n = 1
def n.foo
  'foo'
end
#=> エラーになる

sym = :alice
def sym.bar
  'bar'
end
#=> エラーになる

# aliceというオブジェクトに特異メソッドを追加するもう一つの方法
alice = 'I am Alice'

class << alice
  def shuffle
    chars.shuffle.join
  end
end
alice.shuffle #=> " ci Ama.lIe"

# Rubyで便宜上クラスメソッドを読んでいるものは、実際は特例のクラスの特異メソッド。

# クラスメソッドを定義するコード例
class User
  def self.hello
    'Hello'
  end

  class << self
    def hi
      'Hi.'
    end
  end
end

#特異メソッドを定義数コード例
alice = 'I am alice'

def alice.hello
  'Hello.'
end

class << alice
  def hi
    'Hi.'
  end
end

class User
end

# クラス構文の外部でクラスメソッドを定義する方法1
def User.hello
  'Hello.'
end

# クラス構文の外部でクラスメソッドを定義する方法2
class << User
  def hi
    'Hi.'
  end
end

user.hello #=> "Hello."
User.hi #=> "Hi."

