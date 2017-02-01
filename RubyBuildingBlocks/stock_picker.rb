def stock_picker(prices)
  buy = 0
  sell = 0
  picks = []
  profit = 0
  max_profit = 0

  (0..(prices.length-2)).each do |x|
    (1..(prices.length-1)).each do |y|
      if x < y
        profit = prices[y] - prices[x]
        if profit >  max_profit
          max_profit = profit
          sell = y
          buy = x
        end
      end
    end
  end
  picks << [buy, sell]
  return picks
end
