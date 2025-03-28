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
  pairs = {}
  gains = []
  best_pair = []

  stock_prices.each_index do |day|
    pair = find_pair(stock_prices, day)
    next if pair.nil?

    gain = pair.key(pair.values[0])
    price_values = pair.values[0]
    pairs.store(gain, price_values)
    gains << gain
  end

  best_gain = gains.max
  buy_day = pairs[best_gain][0]
  sell_day = pairs[best_gain][1]
  best_pair << stock_prices.index(buy_day)
  best_pair << stock_prices.index(sell_day)
  best_pair
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
