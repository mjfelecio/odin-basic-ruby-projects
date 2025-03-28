# frozen_string_literal: false

def find_pair(array, idx)
  pair = {}
  smallest_num = array[idx]
  small_idx = array.index(smallest_num)

  highest_num_in_front = array[small_idx + 1, array.length - 1].max

  return nil if highest_num_in_front.nil?

  arr = []
  arr << smallest_num
  arr << highest_num_in_front

  pair[highest_num_in_front - smallest_num] = arr
  pair
end

def stock_picker(stock_prices)
  best_pair = []
  pairs = {}
  gains = []

  stock_prices.each_index do |day|
    pair = find_pair(stock_prices, day)
    next if pair.nil?

    pairs.store(pair.key(pair.values[0]), pair.values[0])
    gains << pair.key(pair.values[0])
  end

  best_gain = gains.max
  best_pair << stock_prices.index(pairs[best_gain][0])
  best_pair << stock_prices.index(pairs[best_gain][1])
  best_pair
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
