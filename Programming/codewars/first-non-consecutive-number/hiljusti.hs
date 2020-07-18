--hiljusti
module FirstNonConsecutive (firstNonConsecutive) where

firstNonConsecutive :: (Eq a,Enum a) => [a] -> Maybe a
firstNonConsecutive (x:y:zs)
  | succ x /= y = Just y
  | otherwise = firstNonConsecutive (y:zs)
firstNonConsecutive _ = Nothing
