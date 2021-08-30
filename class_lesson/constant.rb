# 定数をクラス外部から参照するには
class Product
  DEFAULT_PRICE = 0
end

puts Product::DEFAULT_PRICE

# 定数をメソッドの内部で作成することはできない
class Product
  def foo
    # メソッドのないで定数を作成すると構文エラーになる
    DEFAULT_PRICE = 0
  end
end

# 定数はそのままでは上書きや更新ができてしまうが、freezeを指定すると更新ができなくなる

class Product
  # 配列を凍結する
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    # freezeしている配列に対しては破壊的な変更はできない
    names.dalete('Foo')
    names
  end
end

# エラーが発生するのでうっかり定数の値が変更される事故が防げる
Product.names_without_foo #=> エラーになる

# 上記のコードは配列やハッシュそのものは凍結できても、配列やハッシュの各要素はfreezeしないため、個別にfreezeさせる必要がある
class Product
  # 中身の文字列もfreezeする
  SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze].freeze
end

# mapメソッどを使うとシンプルになる
class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].map (&:freeze).freeze
end

