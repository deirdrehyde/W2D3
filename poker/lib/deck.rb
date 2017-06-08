require_relative 'card'

class Deck

  attr_reader :count, :deck

  SUITS = [:heart, :diamond, :spade, :club]

  def initialize
    @deck = Deck.populate
    @count = @deck.length
  end

  def self.populate
    deck = []
    SUITS.each do |suit|
      13.times do |i|
        deck << Card.new(suit, i + 1)
      end
    end
    deck
  end

  def shuffle!
    @deck.shuffle!
  end

  def deal_hand
    shuffle!
    5.times do
      @hand << deck.pop
    end
  end
end
