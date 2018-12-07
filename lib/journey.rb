class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

    def initialize
      @journey_complete = true
    end

    def set_entry_station(entry_station)
      @entry_station = entry_station
    end

    def set_exit_station(exit_station)
      @exit_station = exit_station
    end

    def set_in_journey
      @journey_complete = false
    end

    def set_end_journey
      @journey_complete = true
    end

    def total_journey
      # @exit_station = exit_station
      # @journey_complete = true
      {entry_station => exit_station}
    end

    def journey_complete?
      @journey_complete
    end

    def penalty_fare_touch_in_twice
      if !@journey_complete
        PENALTY_FARE
      else
        0
      end
    end

    def penalty_fare_touch_out_twice
      if @journey_complete
        PENALTY_FARE
      else
        Card::MIN_FARE
      end
    end
end
