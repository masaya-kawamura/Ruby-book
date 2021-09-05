# Procオベジェクトをブロックの代わりに渡す

# 下記はブロックをメソッドに渡す例
def greeting(&block)
  puts = 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

# 引数のblockはProcオブジェクトである

def greeting(&block)
  # blockのクラス名を表示する
  puts block.class

  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

greeting do |text|
  text * 2
end

#=> Proc
# おはよう
# こんにちはこんにちは
# こんばんわ

#========================================

# ブロックの代わりにProcオブジェクトをメソッドの引数として渡す
# 以下は直接ブロックを渡さずにあらかじめ作成したProcオブジェクトをgreetingメソッドに渡す
def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

# Procオブジェクトを作成し、それをブロックの代わりとしてgreetingメソッドに渡す
repeat_proc = Proc.new { |text| text * 2 }
greeting(&repeat_proc)
#=> おはよう
# こんにちはこんにちは
# こんばんわ

#===========================================