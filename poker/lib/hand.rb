require_relative 'deck'

class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end

  def pair(hand)
    hand.select{ |value| hand.count(value) == 2 }.length == 2
  end

  def two_pair(hand)
    hand.select{ |value| hand.count(value) == 2 }.length == 4
  end

  def three_of_a_kind(hand)
    hand.any? { |value| hand.count(value) == 3 }
  end

  def four_of_a_kind(hand)
    hand.any? { |value| hand.count(value) == 4 }
  end

  def full_house(hand)
    return true if pair(hand) && three_of_a_kind(hand)
  end

  def straight(hand)
    sorted_hand = hand.sort_by { |card| card.value }
    result = []

    sorted_hand.each do |card|
      result << card.value
    end

    (sorted_hand.first.value..sorted_hand.last.value).to_a == result
  end

  def flush(hand)
    hand.all? {|card| hand[0].suit == card.suit }
  end

  def straight_flush(hand)
    return true if straight(hand) && flush(hand)
    false
  end

end
