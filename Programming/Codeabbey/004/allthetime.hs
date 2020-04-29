-- Author allthetime
main = do
  dataFile <- readFile "./4.dat"
  let dataLines = tail $ lines dataFile
  let pairNums = [ show $ minimum $ map (\y -> read y :: Int ) xs | xs <- [words x | x <- dataLines]]
  let answerString = init $ foldr (\x y -> x ++ " " ++ y) "" pairNums
  print answerString
