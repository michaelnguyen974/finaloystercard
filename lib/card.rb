class Card
  attr_reader :balance

  LIMIT = 90

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
end
