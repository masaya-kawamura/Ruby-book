class User
  #いったんpublicメソッドとして定義する
  def foo
  end

  def bar
  end

  # fooとbarをprivateに変更する
  private :foo :bar

  # bazはpublicメソッド
  def baz
  end
end