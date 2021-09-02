module Baseball
  # これはBaseballモジュールの属するSecondクラス
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  #これはClockモジュールに属するSecondクラス
  class Second
    def initialize(digits)
      @digits = digets
    end
  end
end

# 二塁手のAliceを作成する（ちゃんと区別できる）
Baseball::SEcond.new('Alice', 13)

# 時計の13びょうを作成する（ちゃんと区別できる）
Clock::Second.new(13)

# ネストなしで名前空間月のクラスを定義する
# すでにBaseballモジュールが定義されている
module Baseball
end

# モジュール名::クラス名の形でクラスを定義できる
class Baseball::Second
  def initialize(player, uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end
