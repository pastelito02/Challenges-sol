--Author Hennes
faculty :: Integer -> Integer
faculty n
  | n < 2 = 1
  | n >= 2 = n * faculty (n-1)

combinations :: [Integer] -> Integer
combinations [n, k] = (faculty n) `div` ((faculty k) * (faculty (n-k)))

main = do
  putStrLn =<< fmap (unwords . map(show . combinations . map(read) . words) . tail . lines) getContents
