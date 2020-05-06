--Author emmanuelle
import Prelude hiding (Right, Left)
import Data.List

data Direction   = Right | Left deriving Eq
data BracketType = Round | Square | Curly | Angle deriving Eq
data Bracket     = Bracket BracketType Direction

getBracketType      (Bracket btype dir) = btype
getBracketDirection (Bracket btype dir) = dir

matchBracket :: Char -> Maybe Bracket
matchBracket c
  | c == '('  = Just (Bracket Round  Right)
  | c == ')'  = Just (Bracket Round  Left)
  | c == '['  = Just (Bracket Square Right)
  | c == ']'  = Just (Bracket Square Left)
  | c == '{'  = Just (Bracket Curly  Right)
  | c == '}'  = Just (Bracket Curly  Left)
  | c == '<'  = Just (Bracket Angle  Right)
  | c == '>'  = Just (Bracket Angle  Left)
  | otherwise = Nothing

processChar :: [Bracket] -> Char -> [Bracket]
processChar stack c =
  maybe stack (\t ->
    case getBracketDirection t of
      Right -> t : stack
      Left  ->
        case stack of
          []     -> stack
          (x:xs) -> if getBracketType t == getBracketType x
                then tail stack else stack
  ) (matchBracket c)

isLineBalanced :: String -> Bool
isLineBalanced l = null $ foldl' (\stack c -> processChar stack c) [] l

parseAll :: Int -> IO ()
parseAll 0   = putStr "\n"
parseAll cnt = do
  line <- getLine
  putStr $ if isLineBalanced line then "1 " else "0 "
  parseAll (cnt - 1)

main = do
  qty <- getLine
  parseAll $ read qty
