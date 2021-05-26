# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}"
  end

end

#「Alice Rubyさん、20歳」というユーザーオブジェクトを作成する
alice = User.new('Alice', 'Ruby', 20)
# 「Bob Pythonさん、30歳」というユーザーオブジェクトを作成する
bob = User.new('Bob', 'Python', 30)

# どちらもfull_nameメソッドを持つか、保持しているデータが異なるので戻り値は異なる
puts alice.full_name
puts bob.full_name

class User