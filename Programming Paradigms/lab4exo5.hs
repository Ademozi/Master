-- here we have discount and price both as parameters to make the function pure
applyDiscount :: Double -> Double -> Double
applyDiscount discount price = price * (1 - discount)

addToTotal :: Int -> Int -> Int
addToTotal total amount = total + amount

addItem :: [a] -> a -> [a]
addItem cart item = cart ++ [item]