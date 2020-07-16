--mihassan
module LetsGoCrazy where

import Data.Maybe

fruits = [
  (1, "kiwi"),
  (2, "pear"),
  (3, "kiwi"),
  (4, "banana"),
  (5, "melon"),
  (6, "banana"),
  (7, "melon"),
  (8, "pineapple"),
  (9, "apple")]

subtractSum :: Int -> String
subtractSum = fromMaybe "apple" . flip lookup fruits
