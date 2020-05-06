--Author vladilen87
import Data.Bits

readInt :: IO Int
readInt = fmap (head . map read . words) getLine

readInts :: IO [Int]
readInts = fmap (map read . words) getLine

countBits :: Int -> Int -> Int
countBits 0 x = x .&. 1
countBits remain x = (x .&. 1) + countBits (remain - 1) (shift x (-1))

main :: IO ()
main = do
  count <- readInt
  values <- readInts
  putStrLn $ unwords $ map (show . countBits 31) (take count values)
