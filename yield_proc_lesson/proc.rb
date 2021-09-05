# Procオブジェクトの基礎

# "Hello"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new do
  'Hello!'
end

# do~endの代わりに{}を使っても良い
hello_proc = Proc.new { 'Hello' }

#=============================================

# Procオブジェクトを実行するには

# "Hello!"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new { 'Hello!' }
# Procオブジェクトを実行する（文字列が変える）
puts hello_proc.call #=> "Hello!"

# ============================================

# 2つの引数を受け取って、加算するProcオブジェクト
add_proc = Proc.new { |a, b| a + b }
puts add_proc.call(10, 20) #=> 30

add_proc = Proc.new{ |a = 0, b = 0| a + b }
puts add_proc.call #=> 0
puts add_proc.call(10) #=> 10
puts add_proc.call(10, 20) #=> 30

#==========================================

# Proc.newの代わりにprocを使う
add_proc = proc { |a, b| a + b }