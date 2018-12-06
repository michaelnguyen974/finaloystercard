require 'station'
describe Station do
  context '#returns zone and name' do
    let(:name) {double :name}
    let(:zone) {double :zone}
    let(:station) {Station.new(name, zone)}
    it 'gives you zone of station' do
      expect(station.zone).to eql(zone)
    end
    it 'gives you name of station' do
      expect(station.name).to eql(name)
    end
  end
end
