puts 'Start'
module Greeter
  def hello
    'hello'
  end
end

begin
  greeter = Greeter.new
rescue
  puts '例外が発生したが、このまま続行する'
end

# 例外処理を組み込んだので最後まで実行可能
puts 'End'

# method_1にだけ例外処理を記述する
def method_1
  puts 'method_1 start.'
  begin
    method_2
  rescue
    puts '例外が発生しました'
  end
  puts 'method_1 end.'
end

def method_2
  puts 'method_2 start.'
  method_3
  puts 'method_2 end.'
end

def method_3
  puts 'method_3 start.'
  # ZeroDivisionErrorを発生させる
  1 / 0
  puts 'method_3 end.'
end

# 処理を開始する
method_1

begin
  1 / 0
rescue => e
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース ====="
  puts e.backtrace
  puts "=================="
end