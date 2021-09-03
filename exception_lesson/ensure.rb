# 書き込みモードでファイルを開く
file = File.open('some.txt', 'w')

begin
  # ファイルに文字列を書き込む
  file << 'Hello'
ensure
  # 例外の有無に関わらず必ずファイルをクローズする
  file.close
end

# ブロック付きでオープンすると、メソッドの実行後に自動的にクローズする
File.open('some.text', 'w') do |file|
  file << 'Hello'
end

# 実行中に例外が発生した場合もopenメソッドが必ずクローズ処理を実行してくれる
File.open('some.text', 'w') do |file|
  file << 'Hello'
  # わざと例外を発生させる
  1 / 0
end

# 例外は発生するものの、openメソッドによってクローズ処理自体は必ず行われる
#=> ZeroDivisionError: divided by 0