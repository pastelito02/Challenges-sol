--Author wargarbl
import Data.List

main = do
    contents <- getContents
    let input = (init . words) contents
    mapM_ putStr $ intersperse " " $ twiceOrMore input

twiceOrMore :: [String] -> [String]
twiceOrMore l = foldr (\x acc -> if length x > 1 then head x : acc else acc) [] $ group $ sort l