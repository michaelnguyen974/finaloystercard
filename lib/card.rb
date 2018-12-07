require_relative "journey"
require_relative "station"

class Card
  attr_reader :balance, :journey, :station_list

  LIMIT = 90
  MIN_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @station_list=[]
    @journey = journey
  end

  def balance
    @balance
  end

  def top_up(money)
    raise "limit exceeded" if money + @balance > LIMIT
    @balance += money
  end

  def touch_in(entry_location)
    #penalty_fare
    deduct(@journey.penalty_fare_touch_in_twice)
    fail "Insufficient funds" if balance < MIN_FARE
    @journey.set_entry_station(entry_location)
    @journey.set_in_journey
    #@entry_station = entry_station
  end

  # def in_journey?
  #   if entry_station == nil
  #     false
  #   else
  #     true
  #   end
  # end

 def touch_out(exit_location)
    deduct(@journey.penalty_fare_touch_out_twice)
    @journey.set_exit_station(exit_location)
    @journey.set_end_journey
    station_list << @journey.total_journey

    # station_list.push({"entry_station"=>entry_station,"exit_station"=>exit_station})
    # @entry_station = nil
  end


private
  def deduct(fare)
    @balance -= fare
  end

end
