--Author gsou859
suits x = ["C", "D", "H" , "S" ] !! x
ranks x = [ "A","2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"] !! x
displayCard num = suits (num `div` 13) ++ ranks (num `mod` 13)

initialArray = map displayCard [0..51]

swap a b list | a == b = list
          | a > b = swap b a list
          | otherwise = list1 ++ [list !! b] ++ list2 ++ [list !! a] ++ list3
    where   list1 = take a list;
            list2 = drop (succ a) (take b list);
            list3 = drop (succ b) list

swapall numbers = foldl (\acc x -> swap x ( (numbers !! x )`mod` 52 ) acc ) initialArray [0..51]

main = do
    s <- getLine
    let numbers = map read (words s)
    print $ length numbers
    mapM_ (\x -> putStr x >> putStr " ") $ swapall numbers