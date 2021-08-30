class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラスを定義したタイミングで@@nameがDVDに変更される
Product.name #=> Product
DVD.name #=> DVD

product = Product.new('A great movie')
product.name #=> A great movie

# Product.newのタイミングで@@nameがA great movieに変更される
Product.name #=> "A great movie"
DVD.name #=> "A great movie"

dvd = DVD.new('An awesome film')
dvd.name #=> "An awesome file"
dvd.upcase_name "AN AWESOME FILM"

# DVD.newのタイミングで@@nameがAn awesome filmに変更される
product.name #=> An awesome film
Product.name #=> An awesome film
DVD.name #=> An awesome film