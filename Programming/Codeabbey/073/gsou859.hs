--Author gsou859
import Data.Number.CReal
import Data.Char

real = showCReal 8
dcos x = cos $ x * pi / 180
dsin x = sin $ x * pi / 180

addV (a:b:[]) (c:d:[]) = [a+c,b+d]

vect a = [[1,0], [cos (pi/3), sin (pi/3)], [cos(2*pi/3), sin(2*pi/3)], [-1,0], [cos(4*pi/3), sin(4*pi/3)], [cos(5*pi/3), sin(5*pi/3)]] !! (ord a - 65)

distance (steps) = foldl1 addV $ map vect steps

vAbs (a:b:[]) = sqrt $ a^2 + b^2

main = do
  getLine
  fmap (unwords . map (real . vAbs . distance) . lines) getContents >>= putStrLn
