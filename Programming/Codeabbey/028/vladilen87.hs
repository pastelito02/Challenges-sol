--Author vladilen87
calculateBmi :: Double -> Double -> Double
calculateBmi _ 0.0 = 0.0
calculateBmi weight height = weight / (height ^ 2)

checkBmi :: Double -> String
checkBmi bmi
    | bmi < 18.5 = "under"
    | bmi < 25.0 = "normal"
    | bmi < 30.0 = "over"
    | otherwise = "obese"

main = do
    inputCount <- getLine
    let count = read (head $ words inputCount) :: Int
    input <- getContents
    let checkBmis = \(w:h:_) -> checkBmi (calculateBmi w h)
        getHeightWeight = \xs -> map read (words xs) :: [Double]
    putStrLn $ unwords . take count $ map checkBmis $ map getHeightWeight (lines input)
    