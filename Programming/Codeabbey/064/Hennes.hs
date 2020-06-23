--Author Hennes
import Control.Monad.ST
import Control.Monad
import Data.Array.ST
import Data.Array
import Data.Char
import Data.Maybe
import Data.List 

instance (Num a, Num b) => Num (a,b) where
   (a,b) + (a',b') = (a + a', b + b')

directions = [((-1,0), "L"), ((1,0), "R"), ((0,-1), "U"), ((0,1), "D")]

findPath :: (Int, Int) -> (Int, Int) -> Array (Int, Int) Int -> Int -> Int -> String
findPath p1 p2 arr w h =
  if p1 == p2 
  then ""
  else (snd next) ++ findPath (fst next) p2 arr w h 
  where
    curr = arr ! p1
    dirs = [(pn, snd d) | d <- directions, let pn = p1 + (fst d), 
            fst pn > 0 && fst pn <= w && snd pn > 0 && snd pn <= h]
    next = fromJust $ find (\(pn, dn) -> (arr ! pn) == curr - 1) dirs

setTrace :: (Int, Int) -> Int -> STArray s (Int, Int) Int -> Int -> Int -> ST s ()
setTrace p c a w h = do
  writeArray a p c
  forM_ directions $ \d -> do
    let pn = p + (fst d)
    when (fst pn > 0 && fst pn <= w && snd pn > 0 && snd pn <= h) $ do
      cnt <- readArray a pn
      when (cnt == 1) (setTrace pn (c+1) a w h) 

setupGrid :: [String] -> Int -> Int -> Array (Int, Int) Int
setupGrid dat w h = runSTArray $ do
  arr <- newArray ((1,1), (w,h)) 0 :: ST s (STArray s (Int, Int) Int)
  -- Read input data into array
  forM_ [0..w-1] $ \x -> do
    forM_ [0..h-1] $ \y -> do
      writeArray arr (x+1,y+1) $ digitToInt ((dat !! y) !! x)
  -- Trace path from 1,1
  setTrace (1,1) 2 arr w h
  --
  return arr

compressResult :: String -> String 
compressResult s = concat $ map (\e -> (show $ length e) ++ [head e]) $ group s 

main = do
  [w,h] <- fmap (map read . words) getLine
  inputData <- fmap lines getContents
  let grid = setupGrid inputData w h 
  let result = [findPath p (1,1) grid w h | p <- [(w,1), (1,h), (w,h)]]
  putStrLn $ unwords $ map compressResult result
