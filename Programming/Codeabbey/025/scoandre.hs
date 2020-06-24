--Author scoandre
parseArray :: (Read a) => String -> [a] 
parseArray = map read . words

lcg :: (Integral a) => a -> a -> a -> a -> [a] 
lcg a c m x = xnext : lcg a c m xnext
  where xnext = (a * x + c) `mod` m

main :: IO ()
main = do
       n <- getLine
       input <- fmap (take (read n) . lines) getContents
       let output = map ((\[a, c, m, x0, n] -> last $ take n $ lcg a c m x0) . parseArray) input
       putStrLn $ unwords $ map show output