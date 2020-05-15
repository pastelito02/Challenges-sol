--Author Hennes
import Data.List.Split (chunksOf)
import Data.List

consonants = "bcdfghjklmnprstvwxz"
vowels = "aeiou"
numWords = 900000
wordLength = 6

randomNumbers a c m x0 = x0 : randomNumbers a c m (mod (a * x0 + c) m)
specialRandomNumbers x0 = take (wordLength * numWords) $ tail $ randomNumbers 445 700001 2097152 x0

getFunnyWords x0 = gFW (replicate numWords wordLength) (specialRandomNumbers x0) 
    where   
        gFW :: [Int] -> [Int] -> [String]
        gFW (x:xs) numbers = (take x $ foldr (++) "" $ map(\[a,b] -> [(consonants !! (a `mod` 19)), (vowels !! (b `mod` 5))]) $ chunksOf 2 numbers)
                            : gFW xs (drop x numbers)
        gFW _ _ = []

main = do
   let mostFrequentFunnyWord = snd $ head $ sortBy (\a b -> compare (fst b) (fst a)) $ 
                               map (\a -> (length a, head a)) $ 
                               group $ sort $ getFunnyWords 38509
   putStrLn $ "Most frequent funny word is " ++ show mostFrequentFunnyWord
  
  