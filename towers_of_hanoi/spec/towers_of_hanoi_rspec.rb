require 'rspec'
require_relative '../lib/towers_of_hanoi'

describe TowersOfHanoi do
  let(:game) {TowersOfHanoi.new}

  describe "#initialize" do
    it "should make an array of 3 arrays" do
      expect(game.towers).to eq([ [3, 2, 1], [], [] ])
    end
  end

  describe "#move" do
    it "moves a disk to a new tower" do
      game.move(0, 2)
      expect(game.towers).to eq([ [3, 2], [], [1] ])
    end

    it "raises an error if a big disk is placed on a smaller disk" do
      game.move(0, 2)
      expect { game.move(0, 2) }.to raise_error(MoveError)
    end
  end

  describe "#won?" do
    it "return true when the game is over" do
      game.end_game([[], [3, 2, 1], []])
      expect(game.won?).to eq(true)
    end

    it "return false if disks are still in initial tower" do
      expect(game.won?).to eq(false)
    end


  end
end
