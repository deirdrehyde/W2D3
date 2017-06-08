class Array

  def my_uniq
    new_array = []
    self.each do |el|
      new_array << el unless new_array.include?(el)
    end
    new_array
  end

  def two_sum
    pairs = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2, idx2|
        if idx1 < idx2
          pairs << [idx1, idx2] if el1 + el2 == 0
        end
      end
    end
    pairs
  end

end

def my_transpose(matrix)
  dimension = matrix.first.count
  cols = Array.new(dimension) { Array.new(dimension) }

  dimension.times do |i|
    dimension.times do |j|
      cols[j][i] = matrix[i][j]
    end
  end

  cols
end

def stock_picker(stock_prices)
  raise ArgumentError unless stock_prices.is_a?(Array)
  max_profit = 0
  pair = []
  stock_prices.each_with_index do |price1, day1|
    stock_prices.each_with_index do |price2, day2|
      next if day1 >= day2
      if price2 - price1 > max_profit
        max_profit = price2 - price1
        pair = [day1, day2]
      end
    end
  end
  pair
end
