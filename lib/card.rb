class Card
  attr_reader :balance, :entry_station

  LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def top_up(money)
    raise "limit exceeded" if money + @balance > LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    fail "Insufficient funds" if balance < MIN_FARE
  end

  def in_journey?
    if entry_station == nil
      false
    else
      true
    end
  end

  def touch_out
    @entry_station = nil
    deduct(MIN_FARE)
  end


private
  def deduct(fare)
    @balance -= fare
  end

end
