# 無効な国名が渡された際に例外を意図的に発生させる例

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'doller'
  when :india
    'rupee'
  else
    #意図的に例外を発生させる
    raise "無効な国名です #{country}"
  end
end

p currency_of(:japan)
p currency_of(:italy)

#=> `currency_of': 無効な国名です italy (RuntimeError)

# 例外オブジェクトを指定して例外を発生させる
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'doller'
  when :india
    'rupee'
  else
    # RuntimeErrorではなくArgumentErrorを発生させる
    raise ArgumentError, "無効な国名です。（#{country}）"
  end
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'doller'
  when :india
    'rupee'
  else
    # 例外クラスのインスタンスを渡す方法
    raise ArgumentError.new("無効な国名です。（#{country}"）
  end
end
