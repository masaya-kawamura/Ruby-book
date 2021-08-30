# シングルクォーとで囲ったのと同じ意味になる
puts %q!He said, "Don't speak."!

# ダブルクォーとで囲ったのと同じ意味になる
something = "Hello."
puts %!He said, "#{something}"!

# 区切り文字として、?を使用する。
puts %q?He said, "Don't speak."?

# { }を区切り文字として使用する
puts %q{He said, "Don't speak."}

puts ""
puts "-------------------------------------"
puts "ヒアドキュメント(行指向文字列リテラル"
puts "-------------------------------------"
puts ""

# 文字列は途中で改行することもできる
puts "Line1,
Line2"

puts "-------------------------------------------"
# ヒアドキュメントの利用例
# 識別子（下の例ではTEXT）は自由につけられる
a = <<TEXT
これはヒアドキュメントです。
複数行に渡る長い文字列を作成するのに便利です。
TEXT
puts a

puts "-------------------------------------------"

def some_method
  <<-TEXT
  これはヒアドキュメントです。
  <<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end
puts some_method

puts "------------------------------------------"

# <<~を使うと、内部の文字列をインデントさせても先頭の空白部分が無視される
def some_method
  <<~TEXT
    これはヒアドキュメントです。
    <<~を使うと内部文字列のインデント部分が無視されます。
  TEXT
end
puts some_method

puts "-------------------------------------------"

# ヒアドキュメントの中では式展開が有効
name = "Alice"
a = <<TEXT
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a

puts "--------------------------------------------"

# 'TEXT'のようにシングルクォートで囲むと式展開が無効になる。
name = "Alice"
a = <<'TEXT'
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a

puts "---------------------------------------------"

# "TEXT"のようにダブルクォートで記述すると式展開が有効になる
name = "Alice"
a = <<"TEXT"
ようこそ#{name}さん!
以下のメッセージをご覧ください。
TEXT
puts a

puts '-------------------------------------------'

# ヒアドキュメントを直接、引数として渡す
a = 'Ruby'
a.prepend(<<TEXT)
Java
PHP
TEXT
puts a

puts "------------------------------------------"

# ヒアドキュメントで作成された文字列に対して、直接upcaseメソッドを呼び出す。
b = <<TEXT.upcase
Hello,
Good-bye.
TEXT

puts b

puts "-------------------------------------------"
# sprintfメソッドを使用すると、指定したフォーマットの文字列を作成することができる。
# 以下は、少数第３位まで数字を表示する文字列を作成するコード例
puts sprintf('%0.3f', 1.2)

puts "--------------------------------------------"

# 表示したいオブジェクトを複数渡すこともできる。
puts sprintf('%0.3f + %0.6f', 1.2, 0.48)

puts "--------------------------------------------"


