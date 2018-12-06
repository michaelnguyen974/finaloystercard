class Journey

  attr_reader :entry_station

    def initialize(entry_station)
      @entry_station = entry_station
    end

    def total_journey(exit_station)
      {@entry_station => exit_station}
    end

end
