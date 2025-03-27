# frozen_string_literal: false

def stock_picker(stock_prices)
  result = []
  # Get the lowest value on the array
  lowest_val = stock_prices.min
  result << stock_prices.index(lowest_val)

  # Get the lowest value on the array
  highest_val = stock_prices.max
  result << stock_prices.index(highest_val)
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
