--Author h42
f' :: Int -> Int -> Int -> Int -> Int
f' amt goal irate yrs
  | amt >= goal = yrs
  | otherwise = if amt == amt' then -1 else f' amt' goal irate (yrs+1)
  where amt' = floor $ (fromIntegral amt) *
             (1.0 + (fromIntegral irate / 100.0))

f [amt,goal,rate] = f' (amt*100) (goal*100) rate 0

main = do
  inp <- fmap (map (map read.words).tail.lines) getContents :: IO [[Int]]
  mapM putStr $ map ((++)" ".show . f ) inp
