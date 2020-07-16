--heymind
module Codewars.Kata.FakeBinary where

fakeBin :: String -> String
fakeBin = map (\c -> if c < '5' then '0' else '1' )
