--Author Hennes
import Data.Char (digitToInt)
import Data.List.Split (chunksOf)
import Data.List

winner = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]

hasWinner s = owin || xwin
  where
    xwin = not $ null [1 | s <- winner, null (s \\ xs)]
    owin = not $ null [1 | s <- winner, null (s \\ os)]
    xs = map(digitToInt . head) $ chunksOf 2 s
    os = map(digitToInt . last) $ filter (\g -> 2 == length g) $ chunksOf 2 s

findWinner s = if null res then 0 else head res
  where 
    res = [l | l <- [5..9], hasWinner (take l s)]

main = putStrLn =<< fmap (unwords . map (show . findWinner . filter (/= ' ')) . tail . lines) getContents
