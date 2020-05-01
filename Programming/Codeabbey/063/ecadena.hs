--Author ecadena
import Control.Monad
import Data.List
import Data.Numbers.Primes


main :: IO ()
main = do
  l0 <- getLine
  ls <- replicateM (read l0) getLine
  putStrLn $ unwords $ factorizeS <$> ls


factorizeS :: String -> String
factorizeS s =  formatResult $ factorize $ read s


formatResult :: [(Int, Int)] -> String
formatResult r = intercalate "*" $ fmap show $ join $ uncurry replicate <$> r


factorize :: Int -> [(Int, Int)]
factorize n = divConsume n primes


divConsume :: Int -> [Int] -> [(Int, Int)]
divConsume 1 _ = []
divConsume n (p : ps) = case countDivs n p of
  (0, _) -> divConsume n ps
  (c, r) -> (c, p) : divConsume r ps


countDivs :: Int -> Int -> (Int, Int)
countDivs n m = case reverse $ divSeq n m of
  [] -> (0, n)
  ds@((res, _) : _) -> (length ds, res)


divSeq :: Int -> Int -> [(Int, Int)]
divSeq n m =
  takeWhile ((0 ==) . snd) $ iterate ((`quotRem` m) . fst) $ quotRem n m
