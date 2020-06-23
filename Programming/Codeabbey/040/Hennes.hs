--Author Hennes
over a b = let fak n = foldl(*) 1 [1..n] in fak a `div` ((fak b) * (fak (a-b)))

pathsBetween (r1,c1) (r2,c2) = rcsum `over` rdiff
  where
    cdiff = abs(c1-c2)
    rdiff = abs(r1-r2)
    rcsum = cdiff + rdiff

pathsToPit pit pits = pathsBetween (1,1) pit -
    sum (map (\p -> (pathsToPit p pits) * (pathsBetween p pit)) $ 
    filter (\(y, x) -> y <= fst pit && x <= snd pit && (y,x) /= pit) pits)

calculateHiddenPaths pit pits h w = (pathsToPit pit pits) * (pathsBetween pit (h,w))

main = do
  [h, w] <- fmap (map read . words) getLine :: IO [Int]
  grid <- fmap lines getContents
  let pits = map (\(_,r,c) -> (r, c)) $
             filter(\(a,_,_) -> a == "X") $
             zipWith(\a b -> (a, b `div` w + 1, b `mod` w + 1)) (concat $ map words grid) [0..]
  let pathsWoPits = pathsBetween (1,1) (w,h)
  let hiddenPaths = sum [calculateHiddenPaths pit pits h w | pit <- pits]
  putStrLn $ show ( pathsWoPits - hiddenPaths )