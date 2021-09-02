module NameChanger
  def change_name
    # include先のクラスのインスタンス変数を変更する
    @name = 'アリス'
  end
end

class User
  include NameChanger

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
p user.name

user.change_name
p user.name #=> 'アリス'

# 上記のコードをインスタンス変数ではなく、セッターメソッド経由でデータを変更するように修正する

module NameChanger
  def change_name
    #セッターメソッド経由でデータを変更する
    self.name = 'ありす'
  end
end

class User
  include NameChanger

  # ゲッターメソッドとセッターメソッド
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
user.change_name
user.name

# オブジェクトに直接ミックスインする。

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

s = 'abc'

# 文字列は通常logメソッドを持たない
s.log('Hello') #=> エラーになる

# 文字列sにLoggableモジュールのメソッドを特異メソッドとしてミックスインする
s.extend(Loggable)

# Loggableモジュールのlogメソッドが呼び出せるようになる
s.log('Hello.') #=> [LOG] Hello.

