require "card"
describe Card do
  it "have a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "should respond to the top up method" do
    expect(subject).to respond_to :top_up
  end

  it "should add the money to the excistent balance" do
    card = Card.new
    expect(card.top_up(20)).to eq 20
  end

  it "should raise error if balance exceeds 90" do
    maximum = Card::LIMIT
    subject.top_up(maximum)
    expect{subject.top_up(1)}.to raise_error "limit exceeded"
  end

  it 'should deduct money from the balance' do
    card = Card.new
    subject.top_up(20)
    expect(subject.deduct(10)).to eq 10
  end

  it 'starts off not in journey ie false' do
    expect(subject.in_journey).to be false
  end

  it 'should touch-in' do
    subject.top_up (Card::MIN_FARE)
    subject.touch_in
    expect(subject.in_journey).to be true
  end

  it 'should check if in journey' do
    subject.top_up(Card::MIN_FARE)
    subject.touch_in
    expect(subject).to be_in_journey
  end

 it 'should touch-out' do
  subject.top_up(Card::MIN_FARE)
  subject.touch_in
  subject.touch_out
  expect(subject).not_to be_in_journey
 end

 it 'should check min-balance at touch in' do
  expect { subject.touch_in }.to raise_error 'Insufficient funds'
 end

end
