--Author Haskeller
main :: IO()
main = do
  line <- getLine
  let nums = init $ map (\a -> read a :: Int) $ words line
  let n = bubbleNum nums
  print n
  print $ checksum $ bubble nums

bubble [] = []
bubble [x] = [x]
bubble (x:y:xs) = if x > y then y : bubble (x:xs) else x : bubble (y:xs)

bubbleNum :: [Int] -> Int
bubbleNum [] = 0
bubbleNum [x] = 0
bubbleNum (x:y:xs) = if x > y then 1 + (bubbleNum (x:xs)) else 0 + (bubbleNum (y:xs))

checksum nums = foldl (\acc x -> (acc + x) * 113 `mod` 10000007) 0 nums
