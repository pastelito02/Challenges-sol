--Author Haskeller
import Control.Monad

main :: IO()
main = do
--fmap (unwords . map(show) . map(+1) . map (read) . words) getLine
    putStrLn =<< fmap (unwords . map(show) . map(findCycle) . map(read) . words) getLine


findCycle :: Int -> Int
findCycle num = findCycle' num 0 [num]
    where findCycle' n count generated
                | count == 0 = findCycle' (nextNeumann n) (count + 1) (generated ++ [n])
                | n `elem` generated = count
                | otherwise = findCycle' (nextNeumann n) (count + 1) (generated ++ [n])


nextNeumann :: Int -> Int
nextNeumann x = x*x `div` 100 `mod` 10000