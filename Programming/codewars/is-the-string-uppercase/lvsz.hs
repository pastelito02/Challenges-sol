module Codewars.Kata.IsUpperCase where
import Data.Char (isLower)

isUpperCase :: String -> Bool
isUpperCase = all (not . isLower)
