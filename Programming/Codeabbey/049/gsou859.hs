--Author gsou859
winner games = if gamesum > 0 then 1 else 2
    where gamesum = sum (map helper games)
          helper "PP" = 0
          helper "RR" = 0
          helper "SS" = 0
          helper "PR" = 1
          helper "RS" = 1
          helper "SP" = 1
          helper _ = -1

p49 = do 
    getLine
    x <- getContents
    mapM_ (\x -> putStr x >> putStr " ") $ map (show . winner . words) $ lines x