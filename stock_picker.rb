# frozen_string_literal: false

def stock_picker(stock_prices)
  result = []
  p stock_prices.sort
  # Get the lowest value on the array
  lowest_val = stock_prices.min
  lowest_val_idx = stock_prices.index(lowest_val)
  result << lowest_val_idx

  # Get the highest value on the array

  # Get the days after the lowest
  days_after_lowest = stock_prices.slice(lowest_val_idx + 1, stock_prices.length - 1)

  p days_after_lowest
  p days_after_lowest.max
  highest_val = days_after_lowest.max

  highest_val_idx = days_after_lowest.index(highest_val) + 1 + lowest_val_idx
  result << highest_val_idx
end

def get_best_option(stock_prices)
  best_option = 0
  indexes = []

  stock_prices.each do |prices|
    stock_prices.each do |p|
      stock_gain = prices - p
      next unless stock_gain > best_option

      best_option = stock_gain
      indexes.clear
      lowest_val = [prices, p].min
      highest_val = [prices, p].max
      indexes << stock_prices.index(lowest_val)
      indexes << stock_prices.index(highest_val)
    end
  end

  indexes
end

# p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])

# p stock_picker([3, 30, 2, 27, 4, 14])

p get_best_option([17, 3, 6, 9, 15, 8, 6, 1, 10])
