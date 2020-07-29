--Unnamed
module CheckFactor where

checkForFactor :: Int -> Int -> Bool
checkForFactor = (.) (== 0) . mod
