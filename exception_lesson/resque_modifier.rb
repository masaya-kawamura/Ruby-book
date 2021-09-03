require 'date'

def to_date(string)
  begin
    # 文字列のパースを試みる
    Date.parse(string)
  rescue ArgumentError
    # パースできない場合はnilを返す
    nil
  end
end

# パース可能な文字列を渡す
p to_date('2017-01-01') #=> #<Date: 2017-01-01 ((2457755j,0s,0n),+0s,2299161j)>

# パース不可能な文字列を渡す
p to_date('abcdef') #=> nil

# 上記コードを修飾子を使って記述すると
def to_date(string)
  Date.parse(string) rescue nil
end

# パース可能な文字列を渡す
p to_date('2017-01-01') #=> #<Date: 2017-01-01 ((2457755j,0s,0n),+0s,2299161j)>

# パース不可能な文字列を渡す
p to_date('abcdef') #=> nil

# rescue節で例外情報を変数eに格納する
begin
  1 / 0
rescue => e
  puts "#{e.class} #{e.message}"
  puts e.backtrace
end

#=> ZeroDivisionError divided by 0
# exception_lesson/resque_modifier.rb:32:in `/'
# exception_lesson/resque_modifier.rb:32:in `<main>'

# 組み込み変数の$!と$@に格納された例外情報を使う
begin
  1 / 0
rescue
  puts "#{$!.class} #{$!.message}"
  puts $@
end
#=> ZeroDivisionError divided by 0
# exception_lesson/resque_modifier.rb:44:in `/'
# exception_lesson/resque_modifier.rb:44:in `<main>'