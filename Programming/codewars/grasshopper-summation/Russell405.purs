-- Russell405
module Kata where

import Prelude

summation :: Int -> Int
summation 0 = 0
summation n = n + summation (n - 1)

-- Alternative solution
-- summation n =
--   case n of
--     0 -> 0
--     _ -> n + summation (n - 1)
