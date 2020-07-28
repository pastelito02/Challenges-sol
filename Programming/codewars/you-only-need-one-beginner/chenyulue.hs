--chenyulue
module Need where

check :: Eq a => [a] -> a -> Bool
check = flip elem
