--Author ekerothjohannes
main :: IO()
main = do
       s <- readFile ("C:\\Users\\Johannes\\Desktop\\Input.txt")
       mapM_ print [floor (x*6) +1 | x <- drop 1 $ map read $ lines s :: [Double]]
       putStr "ez"
