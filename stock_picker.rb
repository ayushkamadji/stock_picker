def stock_picker(prices)
  yield_hash = {}
  prices.each_with_index do |buy_price, buy_index|
    if buy_index != prices.length - 1
     prices[(buy_index + 1)..(prices.length - 1)].each_with_index do |sell_price, offset_sell_index|
        yield_hash[[buy_index,(buy_index + 1 + offset_sell_index)]] = (sell_price - buy_price)
     end
    end
  end
  return yield_hash.key(yield_hash.values.max)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
