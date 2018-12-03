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
    fail "limit exceeded" if @balance > LIMIT
    @balance += money
  end
end
