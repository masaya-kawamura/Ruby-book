# Procオブジェクトを引数として受け取る(&を付けない)
def greeting(arrange_proc)
  puts 'おはよう'
  text = arrange_proc.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

# Procオブジェクトを普通の引数としてgreetingメソッドに渡す（&を付けない）
repeat_proc = Proc.new { |text| text * 2 }
greeting(repeat_proc)

#=> おはよう
# こんにちはこんにちは
# こんばんわ

# ==========================================
# ちなみに&blockとして渡す例

def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんわ'
end

greeting do |text|
  text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんわ

# 一緒やんけ!!!
#===========================================

# Procオブジェクトは引数として複数指定できる
def greeting(proc_1, proc_2, proc_3)
  puts proc_1.call('おはよう')
  puts proc_2.call('こんにちは')
  puts proc_3.call('こんばんわ')
end

# greetingメソッドに渡すProcオブジェクトを用意する
shuffle_proc = Proc.new { |text| text.chars.shuffle.join }
repeat_proc = Proc.new { |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?" }

#3種類のProcオブジェクトをgreetingメソッドに渡す
greeting(shuffle_proc, repeat_proc, question_proc)

#=> うはよお
# こんにちはこんにちは
# こんばんわ?

# ===========================================