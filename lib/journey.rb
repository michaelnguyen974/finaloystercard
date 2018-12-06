class Journey

  attr_reader :entry_station, :exit_station

    def initialize(entry_station)
      @entry_station = entry_station
      @journey_complete = false
    end

    def total_journey(exit_station)
      @exit_station = exit_station
      @journey_complete = true
      {@entry_station => exit_station}
    end

    def journey_complete?
      @journey_complete
    end

end
