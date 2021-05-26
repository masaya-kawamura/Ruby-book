# puts nil || false || 2 || 3

# # Alice、Bob、Carolと12検索し、最初に見つかったユーザ（nilまたはfalse以外の値）を変数に格納する。
# user = find_user('Alice') || find_user('Bob') || find_user(Carol)
# # 正常なユーザーであればメールを送信する。（左辺が偽であればメール送信は実行されない）
# user.valid? && send_email_to(user)

# t1 = true
# f1 = false

# p !f1 || t1
# p not f1 || t1

# orの活用例、「Aが真？真でなければBせよ」という制御フローに使われる。
# def greeting(country)
#   country or return 'countryを入力してください'

#   if country == 'japan'
#     'こんにちは'
#   else
#     'hello'
#   end
# end

# p greeting(nil)
# p greeting('japan')

# unless文　処理が偽になった場合にのみ処理をする

# status = 'error'
# if status != 'ok'
#   puts '何か異常があります'
# end

# # 上の文をunless文に書き換えると以下のようになる
# # statusが「ok」’じゃなかったら’処理を実行するという意味になる。
# status = 'error'
# unless status == 'ok'
#   puts'何か異常があります'
# end

# # unless文の中でelseを使用することもできる。
# status = 'ok'
# unless status == 'ok'
#   puts '何か異常があります'
# else
#   puts '正常です'
# end

# case文
# 複数の条件を指定する場合には、elsifを重ねるよりも、caseを使った方がシンプルになる。

# case 対象のオブジェクトや式
# when 値1
#   値1に一致した場合の処理
# when 値2
#   値2に一致した場合の処理
# when 値3
#   値3に一致した場合の処理
# else
#   どれにも一致しなかった場合の処理
# end

# coutry = 'italy'

# case coutry
# when 'japan'
#   puts 'こんにちは'
# when 'us'
#   puts 'Hello'
# when 'italy'
#   puts 'ciao'
# else
#   puts '???'
# end

# 条件演算子（三項演算子）
# n = 11
# message = n > 10 ? '10より大きい' : '10以下'

# 引数にデフォルト値付きのメソッド
def greeting(country = 'japan')
  if country == 'japan'
    'こんにちは'
  else
    'Hello'
  end
end

puts greeting('us')

def default_args(a, b, c = 0, d = 0)
  "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end

puts default_args(1, 2)
puts default_args(1, 2, 3)
puts default_args(1, 2, 3, 4)

def foo(time = Time.now, message = bar)
  puts "time: #{time}, ,message: #{message}"
end

def bar
  'Bar'
end

foo