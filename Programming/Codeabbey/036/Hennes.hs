--Author Hennes
module Main where

data Answer = Answer {number :: Int, correct :: Int} deriving Show

check a b = length [x | x <-[0..3], a !! x == b !! x]

numToStr a = pad 4 (show a)
  where
    pad l s = if length s >= l then s else pad l ('0':s)

findNumber ans = [num | num <- [0..9999], null(filter(\a -> check (numToStr num) (numToStr $ number a) /= (correct a)) ans)]

main = do
  answers <- fmap (map(\[a,b] -> Answer (read a) (read b)) . map(words) . tail . lines) getContents
  putStrLn $ show $ findNumber answers
