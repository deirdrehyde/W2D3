require 'rspec'
require_relative '../lib/hand'

describe Hand do
  subject(:current_hand) { Hand.new }

  describe "#initialize" do
    it "returns an empty array" do
      expect(current_hand.hand).to eq([])
    end
  end

  # describe "#set_hand" do
  #   it "returns a hand of 5 cards" do
  #     expect(current_hand.set_hand.length).to eq(5)
  #   end
  # end

  describe "#pair" do
    it "recognizes a pair" do
      expect(current_hand.pair([3, 3, 5, 7, 1])).to eq(true)
    end

    it "recognizes two pairs" do
      expect(current_hand.two_pair([3, 3, 5, 7, 5])).to eq(true)
    end

    it "should return an empty array if more than 2 of a kind" do
      expect(current_hand.pair([3, 3, 3, 7, 1])).to eq(false)
    end
  end

  describe "#three_of_a_kind" do
    it "recognizes three of a kind" do
      expect(current_hand.three_of_a_kind([3, 3, 3, 7, 1])).to eq(true)
    end

    it "should return an empty array if more than 3 of a kind" do
      expect(current_hand.three_of_a_kind([3, 3, 3, 3, 1])).to eq(false)
    end
  end

  describe "#four_of_a_kind" do
    it "recognizes four of a kind" do
      expect(current_hand.four_of_a_kind([3, 3, 3, 3, 1])).to eq(true)
    end
  end

  describe "#full_house" do
    it "recognizes a full house" do
      expect(current_hand.full_house([3, 3, 3, 1, 1])).to eq(true)
    end
  end

  describe "#straight" do
    let(:straight_hand) { [Card.new(:heart, 7), Card.new(:heart, 4),
      Card.new(:heart, 6), Card.new(:heart, 5), Card.new(:heart, 3)] }
    it "recognizes a straight" do
      expect(current_hand.straight(straight_hand)).to eq(true)
    end
  end

  describe "#flush" do
    let(:flush_hand) { Array.new(5, Card.new(:heart, 8)) }
    it "recognizes a flush" do
      expect(current_hand.flush(flush_hand)).to eq(true)
    end

    let(:not_flush) { Array.new(4, Card.new(:heart, 8)) + [Card.new(:spade, 2)] }
    it "recognizes a flush" do
      expect(current_hand.flush(not_flush)).to eq(false)
    end
  end

  describe "#straight_flush" do
    let(:sf) { [Card.new(:heart, 7), Card.new(:heart, 4),
      Card.new(:heart, 6), Card.new(:heart, 5), Card.new(:heart, 3)]}
    it "recognizes a straight_flush" do
      expect(current_hand.straight_flush(sf)).to eq(true)
    end
  end
end
