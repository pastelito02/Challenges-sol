--Author Hennes
import Control.Monad.ST
import Control.Monad
import Data.Array.ST
import Data.Array

numberIterations = 5

iterateLife arr ngArr = do
  -- Copy the array and clear the original
  forM_ [-10..30] $ \row -> do
    forM_ [-10..30] $ \column -> do
      writeArray ngArr (row, column) =<< readArray arr (row, column)
      writeArray arr (row, column) False
  -- Iterate the array
  forM_ [-9..29] $ \row -> do
    forM_ [-9..29] $ \column -> do
      localCell <- readArray ngArr (row, column)
      -- Count neighbour cells
      cells <- mapM (\x -> readArray ngArr x) $ [(x,y) | x <- [row-1..row+1], y <- [column-1..column+1], x /= row || y /= column]
      let activeCells = length $ filter (==True) cells
      when (activeCells == 2 && localCell || activeCells == 3) (writeArray arr (row, column) True)      
  -- Count living cells    
  allCells <- mapM (\x -> readArray arr x) $ [(x,y) | x <- [-10..30], y <- [-10..30]]
  return $ length $ filter (==True) allCells

playLife :: [String] -> [Int]
playLife initialField = runST $ do
  arr <- newArray ((-10,-10), (30, 30)) False :: ST s (STArray s (Int, Int) Bool)
  ngArr <- newArray ((-10,-10), (30, 30)) False :: ST s (STArray s (Int, Int) Bool)
  -- Setup the game grid
  forM_ [0..4] $ \row -> do
    forM_ [0..6] $ \column -> do
      writeArray arr (row, column) $ ((initialField !! row) !! column) == 'X'
  -- Iterate and return result
  return =<< replicateM numberIterations (iterateLife arr ngArr)

main = do
  inputData <- fmap lines getContents
  let result = playLife inputData
  putStrLn $ unwords $ map show result
  
