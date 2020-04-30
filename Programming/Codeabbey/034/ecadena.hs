--Author ecadena
import Control.Monad


main :: IO ()
main = do
  l0 <- getLine
  ls <- replicateM (read l0) getLine
  putStrLn $ unwords $ fmap binarySearchS ls


binarySearchS :: String -> String
binarySearchS str = case fmap read $ words str of
  [a, b, c, d] -> show $ binarySearch (equation a b c d) 0 100 1e-8
  _ -> "ERROR: Number of arguments!"


equation :: (Floating fl, Ord fl) => fl -> fl -> fl -> fl -> fl -> fl
equation a b c d x = a * x + b * sqrt(x ^ 3) - c * exp (-x / 50) - d


binarySearch :: (Floating fl, Ord fl) => (fl -> fl) -> fl -> fl -> fl -> fl
binarySearch fn min max tolerance = bs min max where
  bs min max = let
    mid = (min + max) / 2
    val = fn mid
    in if abs val < tolerance then mid
       else if val < 0 then bs mid max else bs min mid
