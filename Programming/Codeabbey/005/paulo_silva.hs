-- Author paulo_silva
module Main where

import Data.List (intercalate)

lineToNumbers :: String -> [Int]
lineToNumbers = map read . words

main = do
  input <- getContents
  let (_:inputLines)  = lines input
    results = map (minimum . lineToNumbers) inputLines
  putStrLn $ intercalate " " $ map show results
