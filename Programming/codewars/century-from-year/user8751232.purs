module CenturyYear where

import Prelude

century :: Int -> Int
century y = (y - 1) / 100 + 1
