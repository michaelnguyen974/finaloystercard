class Card
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def top_up(money)
    @balance += money
  end
end
