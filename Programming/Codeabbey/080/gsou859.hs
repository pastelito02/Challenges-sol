--author gsou859
pp80 (a:b:[]) = round $ (* 100) $ chances 100 ((read a) / 100) ((read b) / 100)

chances 0 _ _ = 0
chances n a b = a + ((1-a) * (1-b) * chances (n-1) a b)

main = do getLine
          fmap (unwords . map (show . pp80 . words) . lines) getContents >>= putStrLn
