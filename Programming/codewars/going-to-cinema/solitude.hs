-- solitude
module Codewars.G964.Movie where

movie :: Int -> Int -> Double -> Int
movie card ticket perc = length $ takeWhile not $ zipWith (>) systemA systemB where
  systemA = [0, ticket ..]
  systemB = map ceiling $ scanl (+) (toEnum card) $ iterate (perc *) $ perc * toEnum ticket
