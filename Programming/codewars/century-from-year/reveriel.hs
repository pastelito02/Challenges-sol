module Century where

-- 1 .. 100 to 1
-- 2 .. 200 to 2
century::Int -> Int
century year = div (year + 99) 100
