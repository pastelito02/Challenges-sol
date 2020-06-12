--Author danielmmetz
import Data.List (sort)

indicesOfSorted :: Ord a => [a] -> [Int]
indicesOfSorted xs = indicies
  where
    (_, indicies) = unzip . sort $ zip xs [1..]


main = do
    _  <- getLine
    xs <- fmap read . words <$> getLine :: IO [Int]
    let answer = indicesOfSorted xs
    putStrLn . unwords . fmap show $ answer
