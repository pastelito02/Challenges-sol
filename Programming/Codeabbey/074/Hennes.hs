--Author Hennes
import Data.List.Split

minHandLength = 9.0
hrHandLength  = 6.0

calculateHands tm = [10.0 + hrHandLength * sin(hrAngl * 2 * pi), 10.0 + hrHandLength * cos(hrAngl * 2 * pi),
           10.0 + minHandLength * sin(minAngl * 2 * pi), 10.0 + minHandLength * cos(minAngl * 2 * pi)]
  where
    hrAngl = (fromIntegral hour12 + minAngl) / 12.0
    minAngl = fromIntegral min / 60.0
    hour12 = if hour >= 12 then hour - 12 else hour
    [hour, min] = map read $ splitOn ":" tm :: [Int]

main =
  putStrLn =<< fmap (
           unwords . map (unwords . map(unwords . map show . calculateHands) . words) .
           drop 1 . lines
         ) getContents
