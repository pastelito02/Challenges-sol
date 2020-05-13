--Author Hennes
import Data.Maybe
import Data.List

findFibDiv n = snd $ fromJust $ find (\(a,b) -> mod a n == 0 && a /= 0) $ zip fibs [0..]
  where
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = do
    getLine
    putStrLn =<< fmap(unwords . map(show . findFibDiv . read) . words) getLine
