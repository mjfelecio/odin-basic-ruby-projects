# frozen_string_literal: false

def find_buy_sell_pair(array, day)
  pair = {}

  price_today = array[day]
  highest_price_after_today = array[day + 1, array.length - 1].max

  return nil if highest_price_after_today.nil?

  buy_sell_pair = []
  buy_sell_pair << price_today
  buy_sell_pair << highest_price_after_today

  gain = highest_price_after_today - price_today
  pair[gain] = buy_sell_pair
  pair
end

def stock_picker(stock_prices)
  pairs = {}
  gains = []
  best_pair = []

  stock_prices.each_index do |day|
    pair = find_buy_sell_pair(stock_prices, day)
    next if pair.nil?

    gain = pair.key(pair.values[0])
    price_values = pair.values[0]
    pairs.store(gain, price_values)
    gains << gain
  end

  best_gain = gains.max
  buy_day = stock_prices.index(pairs[best_gain][0])
  sell_day = stock_prices.index(pairs[best_gain][1])
  best_pair << buy_day
  best_pair << sell_day
  best_pair
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
