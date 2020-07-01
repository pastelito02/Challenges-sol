--Author Hennes
import Data.List (sortBy)

data Star = Star {name :: String, xpos :: Int, ypos :: Int} deriving Show

rotateStar angle star = Star (name star) (round(distance * cos(alpha + offset))) (round(distance * sin(alpha + offset)))
  where
    distance = sqrt(fromIntegral((xpos star) * (xpos star) + (ypos star) * (ypos star))) :: Float
    alpha :: Float
    alpha
      | xpos star > 0 = atan(fromIntegral(ypos star) / fromIntegral(xpos star))
      | xpos star < 0 = atan(fromIntegral(ypos star) / fromIntegral(xpos star)) + pi
      | ypos star > 0 = 0.5 * pi
      | ypos star < 0 = 1.5 * pi
      | otherwise = 0.0
    offset = (fromIntegral angle) / 180.0 * pi :: Float

sortStars a b     
  | ypos a > ypos b = GT    
  | ypos a < ypos b = LT    
  | otherwise = compare (xpos a) (xpos b)

main = do 
  [_,angle] <- fmap (map read . words) getLine :: IO [Int]
  starfield <- fmap (map (\[a,b,c] -> Star a (read b) (read c)) . map words . lines) getContents
  let rotatedStarField = map (rotateStar angle) starfield
  let sortedStarField = sortBy (sortStars) rotatedStarField  
  putStrLn $ unwords $ map (\x -> name x) sortedStarField
  