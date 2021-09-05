# 4つのProc.new
Proc.new { |a, b| a + b }
proc { |a, b| a + b }

->(a, b) { a + b }
lambda { |a, b| a + b }

#==================================
# ->がラムダを作成するための記号、
# (a, b)は引数リスト。
# { }は引数を使って実行する処理の内容。
# ()は省略可能
-> a, b { a + b }

# 引数がなければ全て省略することも可能
-> { 'Hello' }

# ブロックを作成するときと同様、{}は改行させて使っても構わない
->(a, b) {
  a + b
}

# {}の代わりに、do...endを使うこともできる
->(a, b) do
  a + b
end

# Proc.newと同じように、引数のデフォルト値を持たせることも可能
->(a = 0, b = 0) { a + b }

# ====================================================
# Proc.newとラムダの違い

# 引数の扱い方
# 単純な呼び出しでは違いはない
# Proc.newの作成と実行
add_proc = Proc.new { |a, b| a + b }
add_proc.call(10, 20) #=> 30

# ラムダの作成と実行
add_labmda = ->(a, b) { |a, b| a + b }
add_lambda.call(10)

# ラムダはProc.newより引数のチェックが厳密になる

# Proc.newの場合（引数がnilでもエラーが起きないようにto_iメソッドを使う）
add_proc = Proc.new { |a, b| a.to_i + b.to_i }
#Proc.newは引数が1つまたは3つでも呼び出し可能
add_proc.call (10) #=> 10
add_proc.call(10, 20, 100) #=> 30

# ラムダの場合
add_lambda = ->(a, b) { a.to_i + b.to_i }
# ラムダは個数について厳密なので、引数が2個ちょうどでなければエラーになる
add_lambda.call(10)
#=> エラーになる
add_lambda.call(10, 20, 100)
#=> エラーになる

#==================================================

# Proc.newかラムダかを判断するlambda?メソッド

# Proc.newの場合
add_proc = Proc.new { |a, b| a + b }
add_proc.class #=> Proc
add_proc.lambda? #=> false

# ラムダの場合
add_lambda = -.(a, b) { |a, b| a + b }
add_lambda.class #=> Proc
add_lambda.lambda? #=> true