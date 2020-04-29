-- Author tetetete
parse :: String -> [Integer]
parse x = map read (words x)

problem6 :: [Integer] -> Integer
problem6 x = round $ (/) (fromIntegral $ head x) (fromIntegral $ x!!1)

run :: IO ()
run = do
    stdin <- getContents
    let x = map parse (tail $ lines stdin)
    putStrLn $ unwords $ map (show . problem6) x
