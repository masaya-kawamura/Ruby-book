# 例外発生時にもう一度処理をやり直すretry

# begin
#   # 例外が発生するかもしれない処理
# rescue
#   retry # 処理をやり直す
# end

retry_count = 0

begin
  puts '処理を開始する'
  # わざと例外を発生させる
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします。（#{retry_count}回目）"
    retry
  else
    puts 'retryに失敗しました。'
  end
end

#=>
# 処理を開始する
# retryします。（1回目）
# 処理を開始する
# retryします。（2回目）
# 処理を開始する
# retryします。（3回目）
# 処理を開始する
# retryに失敗しました。
