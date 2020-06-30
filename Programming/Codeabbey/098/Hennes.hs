--Author Hennes
readTreasureMap inp = [round $ fst route, round $ snd route]
  where
    inp' = map(map read) $ map (\[_,a,_,_,_,b] -> [a,b]) $ filter (\x -> x !! 0 == "go") inp
    path = map (\[a,b] -> (fromIntegral a * sina b, fromIntegral a * cosa b)) inp'
    route = foldl (\a b -> (fst a + fst b, snd a + snd b)) (0,0) path
    cosa a = cos $ omega a
    sina a = sin $ omega a
    omega a = fromIntegral a / 180.0 * pi

main = do
    putStrLn =<< fmap (unwords . map(show) . readTreasureMap . map(words) . lines) getContents
    