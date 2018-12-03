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
<<<<<<< HEAD
    fail "limit exceeded" if @balance > LIMIT
=======
    raise "limit exceeded" if money + @balance > LIMIT
>>>>>>> d97ce4aa32db9b82c93d7395f423f403f0666b5d
    @balance += money
  end
end
