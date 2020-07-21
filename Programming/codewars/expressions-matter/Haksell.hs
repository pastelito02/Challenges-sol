--Haksell
module Expression where

expression :: (Ord a, Num a) => a -> a -> a -> a
expression x y z = maximum [expr1, expr2, expr3, expr4, expr5, expr6]
    where expr1 = x + y + z
          expr2 = x + y * z
          expr3 = (x + y) * z
          expr4 = x * y + z
          expr5 = x * (y + z)
          expr6 = x * y * z
