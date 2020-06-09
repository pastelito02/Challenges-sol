--Author lambda_hask
import qualified Data.HashMap.Strict as M
import Data.Maybe

ace score
 | score + 11 <= 21 =  11
 | otherwise = 1

value df val = fromJust (M.lookup val df)
result n = if n <= 21 then (show n) else "BUST"

handscore (x:xs) df score
  | null xs = if x == "A" then score + (ace score) else score + value df x
  | x == "A" = handscore xs df (score + ace score)
  | otherwise = handscore xs df (score + value df x)

main = do
  let df = M.fromList [("2", 2), ("3", 3), ("4", 4), ("5", 5),
                       ("6", 6), ("7", 7), ("8", 8), ("9", 9),
                       ("K", 10), ("Q", 10), ("T", 10), ("J", 10)]

  n <- readFile "input.txt"
  let test = lines n
  mapM_ (putStrLn . result . (\i -> handscore i df 0) . words) test
