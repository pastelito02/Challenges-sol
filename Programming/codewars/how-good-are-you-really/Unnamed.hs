module HowGoodAreYou where

betterThanAverage :: [Int] -> Int -> Bool
betterThanAverage xs y = y * length xs > sum xs
