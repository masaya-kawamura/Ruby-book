# 継承関係とrescue節の順番に注意する

# NomethodErrorが永遠に実行されないコード
begin
  # NoMthodErrorを発生させる
  'abc'.foo
rescue NameError
  # NomethodErrorはここで捕捉される
  puts 'NameErrorです'
rescue NoMethodError
  # このrescue節は永遠に実行されない
  puts "NoMethodErrorです"
end

#=> NameErorrです

begin
  'abc'.foo
rescue NoMethodError
  # NomethodErrorがここで捕捉される
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

#=> NameErrorです