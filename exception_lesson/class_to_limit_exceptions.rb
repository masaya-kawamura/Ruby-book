# 例外クラスを指定して捕捉する例外を限定する

begin
  # 例外が起きうる処理
  1 / 0
rescue ZeroDivisionError # 捕捉したい例外クラス
  # 例外が発生した場合の処理
  puts "0で除算しました"
end

#=> 0で除算しました

# rescue節を複数書くことで異なるエラーに対応する
begin
  'abc'.foo
rescue ZeroDivisionError
  puts '0で除算しました'
rescue NoMethodError
  puts "存在しないメソッドが呼び出されました"
end

#=> 存在しないメソッドが呼び出されました

# 一つのrescue節に複数の例外クラスを指定することも

begin
  'abc'.foo
rescue ZeroDivisionError, NoMethodError
  puts "0で除算したか、存在しないメソッドが呼び出されました"
end

#=> 0で除算したか、存在しないメソッドが呼び出されました

# 例外オブジェクトを変数に格納してカスタムメッセージを作成する方法
begin
  'abc'.foo
rescue ZeroDivisionError, NoMethodError => e
  puts "0で除算したか、存在しないメソッドが呼び出されました"
  puts "エラー: #{e.class} #{e.message}"
end

#=> 0で除算したか、存在しないメソッドが呼び出されました
# エラー: NoMethodError undefined method `foo' for "abc":String
# Did you mean?  for

