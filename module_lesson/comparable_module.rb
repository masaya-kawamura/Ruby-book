p 2 <=> 1
p 2 <=> 2
p 1 <=> 2
p 2 <=> 'abc'

p 'xyz' <=> 'abc'
p 'abc' <=> 'abc'
p 'abc' <=> 'xyz'
p 'abc' <=> 123

p 2 > 1 #=> true
p 2 <= 1 #=> false
p 2 == 1 #=> false

p 'abc' > 'xyz' #=> false
p 'abc' <= 'xyz' #=> true
p 'abc' == 'xyz' #=> false

class Tempo
  include Comparable

  attr_reader :bpm

  # bpmはBeats Per Minuteの略で音楽の速さを表す単位
  def initialize(bpm)
    @bpm = bpm
  end

  #<=>はComparableモジュールで使われる演算子（メソッド）

  def <=>(other)
    if other.is_a?(Tempo)
      bpm <=> other.bpm
    else
      # 比較できない場合はnilを返す
      nil
    end
  end

  def inspect
    "#{bpm}bpm"
  end
end

t_120 = Tempo.new(120) #=> 120bpm
t_180 = Tempo.new(180) #=> 180bpm

t_120 > t_180 #=> false
t_120 <= t_180 #=> true
t_120 == t_180 #=> false

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
# sortメソッドの内部では並べ替えの際に<=>円座因子が使われる
tempos.sort #=> [60bpm, 120bpm, 180bpm]