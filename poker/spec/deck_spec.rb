require 'rspec'
require_relative '../lib/deck'

describe Deck do
  subject(:new_deck) {Deck.new}
  describe "#initialize" do

    it "initializes with 52 cards" do
      expect(new_deck.count).to eq(52)
    end

    it "returns an array" do
      expect(new_deck.deck.class).to eq(Array)
    end
  end

  describe "#populate" do
    it "fills the deck with 52 elements" do
      expect(new_deck.deck.length).to eq(13 * Deck::SUITS.length)
    end

    it "fills the deck with 4 different suits" do
      suits_count = []
      Deck::SUITS.each do |suit|
        suits_count << new_deck.deck.count {|cards| cards.suit == suit}
      end
      expect(suits_count).to eq([13] * Deck::SUITS.length)
    end

    it "fills the deck with 2 pairs of each number from 1 to 13" do
      values = (1..13).to_a
      value_count = []
      values.each do |value|
        value_count << new_deck.deck.count {|cards| cards.value == value}
      end
      expect(value_count).to eq(Array.new(13, 4))
    end

    it "check that all elements in deck are cards" do
      expect(new_deck.deck.first.class).to eq(Card)
    end
  end
end
