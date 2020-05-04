--Author Hennes
letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

over :: Integer -> Integer -> Integer
over a b = let fak n = foldl(*) 1 [1..n] in fak a `div` ((fak b) * (fak (a-b)))

calculate :: [Integer] -> String
calculate [n, k, i] =
  if i < 0 || i >= n `over` k
  then error "i is out of range!"
  else
    map (\x -> letters !! (fromInteger x)) $ calcLoop 0 0 0 []
  where
    calcLoop sum pos currentDigit foundDigits =
      if pos == k
      then foundDigits
      else
        if sum + (over cn nk) > i
        then calcLoop sum (pos+1) (currentDigit + 1) (foundDigits ++ [currentDigit])
        else calcLoop (sum + over cn nk) pos (currentDigit + 1) foundDigits
      where
        nk = k - pos - 1
        cn = n - currentDigit - 1

main=do
  putStrLn =<< fmap (unwords . map (calculate . map read . words)
                     . tail . lines) getContents
