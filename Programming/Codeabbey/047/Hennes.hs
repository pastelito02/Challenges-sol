--Author Hennes
import Data.Char (ord, chr)

decipher :: Char -> Int -> Char
decipher letter k 
    | letter == ' '  = ' ' 
    | letter == '.'  = '.'
    | otherwise = chr $ ((ord letter - 65 + 26 - k) `mod` 26) + 65

main = do 
    (_:k:[]) <- fmap (map(read) . words) getLine
    putStrLn =<< fmap(unwords . map (\row -> map (\c -> decipher c k) row) . lines) getContents
    