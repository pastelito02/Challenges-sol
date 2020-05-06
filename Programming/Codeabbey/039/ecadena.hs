--Author ecadena
import Control.Monad
import Data.Complex
import Data.List
import Data.Maybe


main :: IO ()
main = do
  l0 <- getLine
  ls <- replicateM (read l0) getLine
  putStrLn $ unwords $ mapMaybe spvS ls


spvS :: String -> Maybe String
spvS str = case words str of
  name : nums | spv (fmap read nums) -> Just name
  _ -> Nothing


spv :: [Float] -> Bool
spv nums = let
  arity = genericLength nums
  mean = sum nums / arity
  stdDev = sqrt $ sum (fmap (\x -> (mean - x) ^ 2) nums) / arity
  in stdDev >= mean / 25
