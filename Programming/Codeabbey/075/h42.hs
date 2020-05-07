--Author h42
import Data.List

f :: [Int] -> String
f xs = ans where
  sorted = sort xs
  g = group sorted
  maxlen = maximum (map length g)
  ans = case length g of
      1 -> "yacht"
      2 -> if maxlen == 3 then "full-house" else "four"
      3 -> if maxlen == 3 then "three" else "two-pairs"
      4 -> "pair"
      5 -> if sorted==[1..5] then "small-straight"
         else if sorted==[2..6] then "big-straight"
         else "none"
      _ -> "?"

main = do
  inp <- fmap (map (map read.words).tail.lines) getContents :: IO [[Int]]
  mapM (putStr.(++" ")) $ map f inp
