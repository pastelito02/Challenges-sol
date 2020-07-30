module GradeBook (getGrade) where

getGrade :: Double -> Double -> Double -> Char
getGrade x y z
  | score >= 90 = 'A'
  | score >= 80 = 'B'
  | score >= 70 = 'C'
  | score >= 60 = 'D'
  | otherwise = 'F'
  where score = (x + y + z) / 3
