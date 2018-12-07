require 'card.rb'

describe Journey do

  let(:station){double :station}
  let(:station2){double :station2}


  it "checks the journey complete status on initialize" do
    journey = Journey.new
    expect(journey.journey_complete?).to eq true
  end

  it "sets the entry station" do
    journey = Journey.new
    journey.set_entry_station(station)
    expect(journey.entry_station).to eq(station)
  end

  it "sets the exit station" do
    journey = Journey.new
    journey.set_exit_station(station2)
    expect(journey.exit_station).to eq(station2)
  end

  it "checks if set_in_journey changes status to false" do
    journey = Journey.new
    journey.set_in_journey
    expect(journey.journey_complete?).to eq false
  end

  it "checks if set_end_journey changes status back to true" do
    journey = Journey.new
    journey.set_end_journey
    expect(journey.journey_complete?).to eq true
  end

  it "will check if entry and exit stations have been put into hash" do
    subject.set_entry_station(station)
    subject.set_exit_station(station2)
    expect(subject.total_journey).to eq({station => station2})
  end
  it "if in journey complete is false touch in returns penalty fare" do
    journey = Journey.new
    journey.set_in_journey
    expect(journey.penalty_fare_touch_in_twice).to eq(Journey::PENALTY_FARE)
  end
  it "if in journey complete is true touch out returns penalty fare" do
    journey = Journey.new
    expect(journey.penalty_fare_touch_out_twice).to eq(Journey::PENALTY_FARE)
  end
  it "if in journey complete is true touch in returns penalty fare" do
    journey = Journey.new
    expect(journey.penalty_fare_touch_in_twice).to eq(0)
  end
  it "if in journey complete is false touch out returns min fare" do
    journey = Journey.new
    journey.set_in_journey
    expect(journey.penalty_fare_touch_out_twice).to eq(Card::MIN_FARE)
  end
end
