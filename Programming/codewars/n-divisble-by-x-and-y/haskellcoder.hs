--haskellcoder
module Kata (isDivisible) where

isDivisible :: Int -> Int -> Int -> Bool
isDivisible n x y = (n `mod` x + n `mod` y == 0)
