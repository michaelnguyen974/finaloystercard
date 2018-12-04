class Card
  attr_reader :balance, :in_journey

  LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def balance
    @balance
  end

  def top_up(money)
    raise "limit exceeded" if money + @balance > LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end 

  def touch_in
    in_journey = true 
  end

  def in_journey?
    @in_journey
  end

end
