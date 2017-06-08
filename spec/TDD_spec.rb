require 'rspec'
require_relative '../lib/TDD'

describe Array do

  describe "#my_uniq" do
    it "returns a unique array" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "returns all pairs of indexes that sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "doesn't return a repeated index" do
      expect([0, 1, 2, 3, 4].two_sum).to eq([])
    end

    it "returns the pairs in order" do
      expect([-1, 1, 1].two_sum).to eq([[0, 1], [0, 2]])
      expect([-1, -1, 1].two_sum).to eq([[0, 2], [1, 2]])
    end
  end
end

describe "#my_transpose" do
  let(:a) { [0, 1, 2] }
  let(:b) { [3, 4, 5] }
  let(:c) { [6, 7, 8] }
  let(:matrix) { [a, b, c] }

  it "it transposes a matrix" do
    expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

  it "doesn't call ruby's transpose method" do
    expect(matrix).to_not receive(:transpose)
    my_transpose(matrix)
  end
end

describe "#stock_picker" do
  let(:stock_prices) { [10, 5, 100] }

  it "takes in an array" do
    expect { stock_picker("string") }.to raise_error(ArgumentError)
  end

  it "returns a pair of days for the largest profit" do
    expect(stock_picker(stock_prices)).to eq([1, 2])
  end

  it "checks that buy date is not in the future" do
    expect(stock_picker([10, 5, 100, 1])).to eq([1,2])
  end

end
