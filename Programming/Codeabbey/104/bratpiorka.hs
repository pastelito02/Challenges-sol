--Author bratpiorka
import Text.Printf

area [x1, y1, x2, y2, x3, y3] = sqrt (s * (s - a) * (s - b) * (s - c)) where
  a = sqrt ((x2 - x1) ** 2 + (y2 - y1) ** 2)
  b = sqrt ((x3 - x1) ** 2 + (y3 - y1) ** 2)
  c = sqrt ((x3 - x2) ** 2 + (y3 - y2) ** 2)
  s = (a + b + c) / 2.0

main = do
  input <- readFile "..\\codeabbey\\input.txt" -- read from file
  -- input <- getContents
  print . unwords . map(printf "%.7f" . area) . vals $ input where
    vals = map(map(read) . words) . tail . lines :: String -> [[Double]]
