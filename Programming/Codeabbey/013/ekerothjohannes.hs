--Author ekerothjohannes
main :: IO()

main = do

       s <- readFile ("C:\\Users\\Johannes\\Desktop\\Input.txt")

       let elems = map calcExp $map read $ drop 1 $ words s :: [[Int]]
       let zips  = map (zipWith (*) [1..]) elems

       mapM_ print $ map sum zips

       putStr ""




calcExp :: Int -> [Int]
calcExp someInt =  digits 10 someInt
