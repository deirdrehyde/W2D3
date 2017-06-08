class TowersOfHanoi
  attr_accessor :towers

  def initialize(towers = nil)
    @towers = towers || [[3, 2, 1], [], []]
  end

  def move(start_tower, end_tower)
    if valid_move?(start_tower, end_tower)
      @towers[end_tower] << @towers[start_tower].pop
    else
      raise MoveError
    end
  end

  def valid_move?(start_tower, end_tower)
    if (@towers[end_tower].empty? && !@towers[start_tower].empty?) ||
      @towers[start_tower].last < @towers[end_tower].last
      return true
    end

    false
  end

  def won?
    @towers[0].empty? && @towers[1..2].any?(&:empty?)
  end

  def end_game(tower)
    @towers = tower
  end
end

class MoveError < StandardError
end
