--Author Hennes
suits = ["Clubs", "Spades", "Diamonds", "Hearts"]
ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

translateName n = (ranks !! rank) ++ "-of-" ++ (suits !! suit)
    where
        rank = mod n 13
        suit = div n 13
        
main = do
    getLine
    putStrLn =<< fmap(unwords . map(translateName . read) . words) getLine
    