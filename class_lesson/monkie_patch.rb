# 以下のUserクラスは外部ライブラリで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

# モンキーパッチを当てる前の挙動を確認する
user = User.new('Alice')
user.hello #=> 'Hello, Alice!'

# helloメソッドにモンキーパッチをあてて独自の挙動を持たせる
class User
  def hello
    "#{@name}さん、こんにちは！"
  end
end

# メソッドの定義を上書きしたのでhelloメソッドの挙動が変わっている
user.hello #=> "Aliceさん、こんにちは！"

# 以下のUserクラスは外部ライブラリで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hellom #{@name}!"
  end
end

# モンキーパッチを当てるためにUserクラスを再オープンする
class User
  #既存のhelloメソッドはhello_originalとして呼び出せるようにしておく
  alias hello_original hello

  # helloメソッドにモンキーパッチをあてる
  # （元々実装されていたhelloメソッドを再利用する
  def hello
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end

# モンキーパッチを当てたhelloメソッドの挙動を確認する
user = User.new('Alice')
user.hello #=> "Hello, Alice! じゃなくて、 Aliceさん、こんにちは！"