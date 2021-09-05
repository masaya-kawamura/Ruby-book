# # ブロックをメソッドの引数として受け取る
# def メソッド(&引数)
#   # ブロックを実行する
#   引数.call
# end

#====================================

# ブロックをメソッドの引数として受け取る
def greeting(&block)
  puts 'おはよう'
  # callメソッド使ってブロックを実行する
  text = block.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

greeting do |text|
  text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ

# =======================================

# ブロックが渡されたかどうかは、その引数がnilかどうかで判断できる

def greeting(&block)
  puts 'おはよう'
  # ブロックが渡されていなければblockはnilになる
  unless block.nil?
    text = block.call('こんにちは')
    puts text
  end
  puts 'こんばんわ'
end

# ブロックなしで呼び出す
greeting

#=> おはよう
# こんばんわ

# ブロック付きで呼び出す
greeting do |text|
  text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ

#================================================

# ブロックを引数として渡すメリットの例
# 日本語と英語のgreetingメソッドを用意する例では、greeting_jaメソッドやgreeting_enメソッドはブロックを受け取るだけで自分では実行せず、共通処理を定義したgreeting_commonメソッドにブロックを渡している。

#日本語版のgreetingメソッド
def greeting_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんわ']
  #ブロックを別のメソッドに引き渡す
  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ['good moning', 'hello', 'good evening']
  # ブロックを別のメソッドに引き渡す
  greeting_common(texts, &block)
end

# 出力処理用の共通メソッド
def greeting_common(texts, &block)
  puts texts[0]
  # ブロックを実行する
  puts block.call(texts[1])
  puts texts[2]
end

#日本語版のgreetingメソッドを呼び出す
greeting_ja do |text|
  text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ

# 英語版のgreetingメソッドを呼び出す
greeting_en do |text|
  text.upcase
end

# =============================================

# 引数名の手前に&をつけると、ブロックとしてみなされる
greeting_common(texts, &block)

# &なしで呼び出すと、普通の引数の一つとしてみなされる
greeting_common(texts, block)
#=> ArgumentErrorになる

# ===========================================

# ブロック引数に応じて、yieldで渡す引数の個数と内容を変えるコード例
def greeting(&block)
  puts 'おはよう'
  text =
    if block.arity == 1
      # ブロック引数が1個の場合
      yield 'こんにちは'
    elsif block.arity == 2
      # ブロック引数が2個の場合
      yield 'こんに','ちは'
    end
  puts text
  puts 'こんばんわ'
end

# 1個のブロック引数でメソッドを呼び出す
greeting do |text|
  text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ

# 2個のブロック引数でメソッドを呼び出す
greeting do |text_1, text_2|
  text_1 * 2 + text_2 * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ
