--Author lambda_hask
import Data.List.Split
import Data.Numbers.Primes
import Control.Monad

parseInt :: String -> [Int]
parseInt x = map read  $ splitOn " " x

main = do
    let p = primes
    n <- readFile "input.txt"
    let challInput = map parseInt (lines n)
    forM_ challInput$ \n -> do
        print $ length $ filter (>= n!!0) $ takeWhile (<= n!!1) primes
