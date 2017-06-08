require 'rspec'
require_relative '../lib/card'

describe Card do

  describe "#initialize" do
    subject(:card) {Card.new(:heart, 8)}

    it "establishes a value for the card" do
      expect(card.value).to eq(8)
    end

    it "establishes a suit for the card" do
      expect(card.suit).to eq(:heart)
    end
  end
end
