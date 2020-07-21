module Kata (expressionMatter) where

import Prelude

expressionMatter :: Int -> Int -> Int -> Int
expressionMatter a b c = (a + b + c) `max` (a * (b + c)) `max` ((a + b) * c) `max` (a * b * c)
