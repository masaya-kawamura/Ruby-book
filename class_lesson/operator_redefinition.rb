class Product
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end

  def code
    @code
  end

  def ==(other)
    # レシーバのオブジェクトがProductクラスのインスタンスであればtrue、そうでなければfalseを返す
    if other.is_a?(Product)
      # 商品コードが一致すれば同じProductと見なす
      code == other.code
    else
      false
    end
  end
end

# aとcが同じ商品コード
a = Product.new('A-0001', 'A great movie')
b = Product.new('B-0001', 'Anawesome film')
c = Product.new('A-0001', 'A great movie')

# ==がこのように動作して欲しい
p a == b #=> false
p a == c #=> true

# 下記のように呼び出しても正しく動作する
p a.==(b) #=> false
p a.==(c) #=> true

# ハッシュ上では1と1.0は別々のキーとして扱われる
h = { 1 => 'Integer', 1.0 => 'Float' }
h[1] #=> Integer
h[1.0] #=> Float

# 異なるキーとして扱われるのは、aql?メソッドで比較した時にfalseになるため
1.eql?(1.0) #=> false

a = 'japan'
b = 'japan'

# eql?が真なら、hash値も同じ
a.eql?(b) #=> true
p a.hash #=> -1299687972299042789
p b.hash #=> -1299687972299042789

text = '03-1234-5678'

case text
when /^\d{3}-\{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d;-\d+$/
  puts '電話番号'
end

#=> 電話番号です

value = [1, 2, 3]

# 内部的にはString === value, array === value, Hash === valueの結果が評価されている
case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when Hash
  puts 'ハッシュです'
end

#=> 配列です