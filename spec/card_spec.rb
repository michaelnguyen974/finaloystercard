require "card"
describe Card do
  it 'have a balance of zero' do
    card = Card.new(0)
    expect(card.balance).to eq 0
  end

end
