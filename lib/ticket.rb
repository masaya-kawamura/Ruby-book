class Ticket
  attr_reader :fare, :stamped_at
  #Ticket.newで切符の購入額（fare)を受け取る
  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stamped_at = name
  end

end