--Author Hennes
solveRiddle (heapSize, maxMatches, strategy) =
  if strategy == "n"
  -- Who takes last match wins
  then heapSize `mod` (1+maxMatches)
  -- Who takes last match loses
  else (heapSize-1) `mod` (1+maxMatches)
    
main = do
  inputData <- getContents
  let jobs = map (\[a,b,c] -> (read a :: Int, read b :: Int, c)) $ map words $
             tail $ lines $ inputData :: [(Int, Int, String)]
  let solutions = map solveRiddle jobs
  putStrLn $ unwords $ map show solutions
