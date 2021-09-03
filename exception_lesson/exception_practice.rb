# 大量のユーザーにメールを送信する（例外が起きても最後まで続行する）
users.each do |user|
  begin
    # メール送信を実行する
    send_mail_to(user)
  rescue => e
    #例外のクラス名、エターメッセージ、バックトレースをターミナルに出力
    # （ログファイルがあればそこに出属する方がベター）
    puts "#{e.class}: #{e.message}"
    puts e.backtrace
  end
end

# 例外処理の対象範囲と対象クラスを極力絞り込む
#下記コードだと例外処理の範囲が広すぎる
require 'date'

# 平成の日付文字列をDateオブジェクトに変換する
def comvert_heisei_to_date(heisei_text)
  begin
    m = heisei_text_match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    Date.new(year, month, day)
  rescue
    # 例外が起きたら(=無効な日付が渡されたら)nilを返したい
    nil
  end
end


# 例外処理の範囲を絞った例

require 'date'

# 平成の日付文字列をDateオブジェクトに変換する
def comvert_heisei_to_date(heisei_text)
  m = heisei_text_match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:month].to_i
  day = m[:day].to_i
  # 例外処理のハニを狭め、補足する例外クラスを限定する
  begin
    Date.new(year, month, day)
  rescue ArgumentError
    # 無効な日付であればnilを返す
    nil
  end
end

# 例外処理より条件分岐を使う

require 'date'

def comvert_heisei_to_date(heisei_text)
  m = heisei_text_match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:month].to_i
  day = m[:day].to_i
  #正しい日付の場合のみ、Dateオブジェクトを作成する
  if Date.valid_date?(year, month, day)
    Date.new(year, month, day)
  end
end

# 予期しない条件は異常終了させる

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'doller'
  when :india
    'rupee'
  else
    raise ArgumentError, "無効な国名です。#{country}"
  end
end

currency_of(:italy)
#=> ArgumentError: 無効な国名です。italy