# 例題：配列やハッシュ自身と内部の全要素をfreezeできるようにするdeep_freezeメソッドを作成する

class Team
  COUNTRIES = deep_freeze(['japan', 'US', 'India'])
end

# 配列自身と配列の全要素がfreezeされている
p Team::COUNTRIES.frozen?
p Team::COUNTRIES.all? { |country| country.frozen? }

class Bank
  CURRENCIES = deep_freeze({ 'Japan' => 'yen', 'US' => 'doller', 'India' => 'rupee' })
end

# ハッシュ自身とハッシュの全要素（キーと値）がfreezeされている
Bank::CURRENCIES.frozen? #=> true
Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? } #=> true

