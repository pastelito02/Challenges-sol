--Author Hennes
import Data.List
import Data.Maybe

sortIt :: [Int] -> [Int]
sortIt vec
         | length vec < 2 = []
         | otherwise = (maxPos vec) : sortIt (init (take (maxPos vec) vec ++ [last vec] ++ drop (1 + maxPos vec) vec))
         where maxPos n = fromJust $ elemIndex (maximum n) n
            
main = putStrLn =<< fmap (unwords . map show . sortIt . map read . words . head . tail . lines) getContents
