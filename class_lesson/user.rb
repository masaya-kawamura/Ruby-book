# users = []
# users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
# users << { first_name: 'Bob', last_name: 'Python', age: 30 }

# users.each do |user|
#   puts "氏名: #{user[:first_name]} #{user[:last_name]}, 年齢: #{user[:age]}"
# end

# # userには{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}のようなオブジェクトが渡される
# def full_name(user)
#   "#{user[:first_name]} #{user[:last_name]}"
# end

# users.each do |user|
#   puts "氏名: #{full_name(user)} 年齢：#{user[:age]}"
# end

# ================ classを使った場合 ======================

# class User
#   attr_reader :first_name, :last_name, :age

#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name  = last_name
#     @age       = age
#   end
#   #氏名を作成するメソッドをクラウ内部で定義する。
#   def full_name
#     "#{first_name} #{last_name}"
#   end
# end

# users = []
# users << User.new('Alice', 'Ruby', 20)
# users << User.new('Bob', 'Python', 30)

# users.each do |user|
#   puts "氏名: #{user.full_name}、年齢: #{user.age}"
# end

# # =========================================================

# masaya = User.new("Masaya", "Kawamura", 29)
# puts masaya.full_name
# puts masaya.first_name

# class User2
#   attr_accessor :name, :age

#   def initialize(name, age)
#    @name = name
#    @age = age
#   end

# #   def name
# #     @name
# #   end

# #   def name=(value)
# #     @name = value
# #   end

# #   def hello
# #     "Hello, I am #{@name}"
# #   end
# end

# user2 = User2.new('Alice', 20)
# user2.name = 'Bob'
# user2.age = 30
# puts "名前: #{user2.name} 年齢: #{user2.age}"

class User
  def initialize(name)
    @name = name
  end

  #self.をつけるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  # これはインスタンスメソッド
  def hello
    "Hello, I am #{ @name }."
  end

end

alice = User.new('Alice')
puts alice.hello

bob = User.new('Bob')
puts bob.hello

names = ['Alice', 'Bob', 'Carol']
# クラスメソッドの呼び出し
users = User.create_users(names)
users.each do |user|
  #インスタンスメソッドの呼び出し
  puts user.hello
end