module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end

  # logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
  # (modele_functionは対象メソッドの定義よりも下で呼び出すこと)
  module_function :log
end

# モジュールの特異メソッドとしてlogメソッドを呼び出す
Loggable.log('Hello.') #=> [LOG] Hello.

# Loggableモジュールをincludeしたクラスを定義する
class Product
  include Loggable

  def title
    # includeしたLoggableモジュールのlogメソッドを呼び出す
    log 'title is called.'
    'A great movie'
  end
end

# ミックスインとしてlogメソッドを呼び出す
product = Product.new
p product.title
#=> [LOG] title is called.
# "A great movie"

# ================================================================

# モジュール関数となったメソッドは、他のクラスにミックスインすると自動的にprivateメソッドになる
product = Product.new
product.log 'Hello.' #=> エラーになる

# ================================================================

# module_functionメソッドを引数なしで呼び出した場合は、そこから下のメソッドが全てモジュール関数となる
module Loggable
  # ここから下のメソッドは全てモジュール関数
  module_function

  def log(text)
    puts "[LOG] #{text}"
  end
end

# ================================================================

# モジュールに定数を定義する
module Loggable
  # 定数を定義する
  PREFIX = '[LOG]'.freeze

  def log(text)
    puts "#{PREFIX} #{text}"
  end
end

# 定数を参照する
Loggable::PREFIX #=> "[LOG]"

# ================================================================

# モジュールの特異メソッドとしてsqrt（平方根）メソッドを利用する
Math.sqrt(2) #=> 1.4142135623730951

class Calculator
  include Math

  def calc_aqrt(n)
    #ミックスインとしてMathモジュールのsqrtメソッドを使う
    sqrt(n)
  end
end

calculator = Calculator.new
calculator.calc_sqrt(2) #=> #=> 1.4142135623730951