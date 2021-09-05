# 通常のコード
def greeting
  puts 'おはよう'
  puts 'こんばんわ'
end

greeting
#=> おはよう
# こんばんわ

#===================================

# メソッドの呼び出し時に適当なブロックをつけてみる
greeting do
  puts 'こんにちは'
end
#  エラーにはならないが上記と結果が変わることはない

#===================================

# 渡されたブロックを実行するためにはメソッド内でyieldを使う

def greeting
  puts 'おはよう'
  #ここでブロックの処理を呼び出す
  yield
  puts 'こんばんわ'
end

# こうするとメソッド呼び出し時に紐つけたブロックが実行されるようになる。
greeting do
  puts 'こんにちは'
end

#=> おはよう
# こんにちは
# こんばんわ

#===================================

# yieldを複数回書けば、ブロックも複数回呼ばれる
def greeting
  puts 'おはよう'
  # ブロックを2回呼び出す
  yield
  yield
  puts 'こんばんわ'
end

greeting do
  puts 'こんにちは'
end

#=> おはよう
# こんにちは
# こんにちは
# こんばんわ

#===================================

# yieldを記述したメソッドをブロックを付けずに呼び出すとエラーになる
greeting
#=> no block given (yield) (LocalJumpError)

#===================================

# ブロックが渡されたか確認するにはblock_given?メソッドを使う

def greeting
  puts 'おはよう'
  if block_given?
    yield
  end
  puts 'こんばんわ'
end

greeting
#=> おはよう
# こんばんわ

greeting do
  puts 'こんにちは'
end

#=> おはよう
# こんにちは
# こんばんわ

#===================================