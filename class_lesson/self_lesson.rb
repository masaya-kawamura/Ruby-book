class User
  attr_accessor :name

  # def name
  #   @name
  # end

  # def name=(value)
  #   @name = value
  # end

  def initialize(name)
    @name = name
  end

  def hello
    #selfなしでnameメソッドを呼び出している
    puts "Hello, I am #{name}"
  end

  def hi
    # self付きでnameメソッドを呼び出している
    puts "Hi, I am #{self.name}"
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    puts "My name is #{@name}"
  end
end

user = User.new('Alice')

user.hello
user.hi
user.my_name