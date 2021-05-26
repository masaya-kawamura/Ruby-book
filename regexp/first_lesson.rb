# 電話番号を抜き出す正規表現
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
puts text.scan /\d\d-\d\d\d\d-\d\d\d\d/

# クープ バゲットのレビューを検索する正規表現
text2 = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

puts text2.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)

# 文字列の特定の箇所を抜き出す正規表現
html = <<-HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

puts replaced


# def hello(name)
#   puts "Hello, #{name}!"
# end

# hello('Alice')

# hello('Bob')

# hello('Carol')

# 無駄なスペースとタブ文字を抽出する正規表現
text2 = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
     
hello('Bob')
	
hello('Carol')
TEXT

puts text2.gsub(/^[ \t]+$/, '')

# :の後のスペースを調整する練習
# 正規表現は:[ \t]*　置換文字は:
{
  japan: 'yen',
  america: 'dollar',
  italy: 'euro'
}

#カンマ区切りをタブ文字区切りに置換えする練習
name,email
alice,alice@example.com
bob,bob@example.com