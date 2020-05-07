--Author faked_IQ
main = do
  contents <- readFile "input21.txt"
  let wert = stringtoint . words . head . tail . lines $ contents
  let ergebnis = (map show) . (map fkt) $ wert
  writeFile "output21.txt" (stringconcat ergebnis)

fkt :: Int -> Int
fkt n = fktrek n 0

fktrek :: Int -> Int -> Int
fktrek n akk
    | n == 1 = akk
    | even(n) = fktrek (n `div` 2) (akk+1)
    | otherwise = fktrek (3*n+1) (akk+1)

stringconcat :: [String] -> String
stringconcat [] = []
stringconcat (head:tail) = head ++ " " ++ stringconcat(tail)

stringtoint :: [String] -> [Int]
stringtoint [] = []
stringtoint (head:tail) = (read head) : stringtoint(tail)
