--Author Hennes
import Data.List
import Data.Maybe

demaskZero (x:xs) = (if x == '0' then 'z' else x) : demaskZero xs
demaskZero [] = []

swapMinimum [] _ = []
swapMinimum (l:ls) fd = 
  if isNothing $ find (<l) ls' 
  then l : swapMinimum ls False
  else (ls !! p) : take p ls ++ [l] ++ drop (p+1) ls
  where p = length ls - 1 - (fromJust $ elemIndex (minimum ls') $ reverse ls')
        ls' = if fd then demaskZero ls else ls
          
swapMaximum [] = []
swapMaximum (l:ls) =
  if isNothing $ find (>l) ls
  then l : swapMaximum ls
  else (ls !! p) : take p ls ++ [l] ++ drop (p+1) ls
  where p = length ls - 1 - (fromJust $ elemIndex (maximum ls) $ reverse ls)

swapDigits l = [swapMinimum l True, swapMaximum l]

main = do
  putStrLn =<< fmap(unwords . map(unwords . swapDigits) . tail . lines) getContents

