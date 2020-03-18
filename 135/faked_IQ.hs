--Author faked_IQ
import Data.Maybe
import Numeric
import Data.Char

main = do
    contents <- readFile "input135.txt"
    let eingabe = head . lines $ contents
    let ergebnis = fkt eingabe
    let ausgabe = unwords $ ergebnis
    writeFile "output135.txt" ausgabe

fkt :: String -> [String]
fkt [] = []
fkt list = map (fill . (map toUpper) . (\x -> showHex x []) . (hsToHex 0) . reverse) . chunks . addO . strToHexstr $ list
               where strToHexstr = foldr (\x -> ((fromJust(lookup x code)) ++)) ""
                     addO l = l ++ (replicate (8 - (length(l) `mod` 8)) '0')
                     chunks l = if l == [] then [] else [(take 8 l)] ++ (chunks (drop 8 l))
                     fill s = if length(s) == 1 then ('0':s) else s

hsToHex :: Int -> String -> Int
hsToHex _ [] = 0
hsToHex n (kopf:rest) = (read [kopf] :: Int)*(2^n) + (hsToHex (n+1) rest)

code :: [(Char,String)]
code = [(' ',"11"),('e',"101"),('t',"1001"),('o',"10001"),('n',"10000"),('a',"011"),('s',"0101"),('i',"01001"),
        ('r',"01000"),('h',"0011"),('d',"00101"),('l',"001001"),('!',"001000"),('u',"00011"),('c',"000101"),('f',"000100"),
        ('m',"000011"),('p',"0000101"),('g',"0000100"),('w',"0000011"),('b',"0000010"),('y',"0000001"),('v',"00000001"),('j',"000000001"),
        ('k',"0000000001"),('x',"00000000001"),('q',"000000000001"),('z',"000000000000")]
