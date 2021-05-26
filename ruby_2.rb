# a = [1, 2, 3]
# b = [1, 2, 3]

# p a.push(*b)

# def greeting(*names)
#     "#{names.join('と')}、こんにちは!"
# end

# puts greeting("田中さん", "鈴木さん", "佐藤さん")

# a = [1, 2, 3]
# p [0, 1, 2, *a, 4, 5]

# fruits = ["apple", "orange", "melon"]
# p fruits.delete_if.with_index { |fruit, i| fruit.include?("a") && i.odd? }

# dimensions = [
#     [10, 20],
#     [30, 40],
#     [50, 60]
# ]

# areas = []
# dimensions.each do |length, width|
#     areas << length * width
# end

# p areas

# a = []
# 10.step(1, -2) {|n| a << n}
# p a

class　treasurer
    attr_accsessor :name
    attr_accsessor :price

    def initialize(name:, price:)
        self.name = name
        self.price = price
    end

    def info
        return "#{self.name} : #{self.price}"
    end

    def 

