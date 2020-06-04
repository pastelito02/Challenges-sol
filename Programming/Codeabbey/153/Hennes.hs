--Author Hennes
import Data.List (find)
import Data.Maybe
import Data.Char (chr, digitToInt)
import Debug.Trace
import Math.NumberTheory.Moduli (invertMod, powerModInteger)

n = 1504275169289991604206978016012592094440060513092419853646369675355799767817296328747621021
cipher = 624929489324746625958114512203387165066924448008140322546144631816596163870013941540375697
e = 65537

heronSquare :: Integer -> Int -> Integer
heronSquare val digits = hs1 one
  where
    one = 10^digits :: Integer
    hs1 :: Integer -> Integer    
    hs1 r =
      if
        abs(r-d) < 100000
      then
        fromJust(find(\x -> x*x > val * one) [(if r < d then r else d)..]) - 1       
      else
        hs1 ((r+d) `div` 2)
      where
        d = (val * one) `div` r :: Integer

isSquare :: Integer -> Bool
isSquare n = let hs = heronSquare n 0 in hs * hs == n

sqrt_n = heronSquare n 0
fermat_x' = fromJust $ find (\x -> x*x > n && isSquare(x*x - n)) [sqrt_n..]
fermat_y' = heronSquare (fermat_x' * fermat_x' - n) 0
p = fermat_x' - fermat_y'
q = fermat_x' + fermat_y'

phi_n = n - q - p + 1
d = invertMod e phi_n
a = if isJust d
    then Just (powerModInteger cipher (fromJust d) n)
    else Nothing
k = (e * fromJust d - 1) `div` phi_n
decode x = dec (show x)
  where
    dec [] = []
    dec (n1:n2:ns) =
      if num > 0
      then chr(10 * (digitToInt n1) + digitToInt n2) : dec ns
      else []
      where
        num = 10 * (digitToInt n1) + digitToInt n2
result = decode (fromJust a)
