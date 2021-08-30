# グローバル変数の宣言と値の代入
$program_name = 'Awesome program'

# グルーバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameにはすでに名前が代入されている
Program.name #=> Awesome program

program = Program.new('Super program')
program.name #=> "Super program"

# Program.newのタイミングで$program_nameがSuper programに変更される
Program.name #=> "Super program"
$program_name #=> "Super program"