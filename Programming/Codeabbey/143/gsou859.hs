--Author gsou859

eeInit [x,y] = eea x y 1 0 0 1

eeShow (r,s,t) = show r ++ ' ': show s ++ ' ': show t

eea :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer -> (Integer, Integer, Integer)
eea q 0 sp sc tp tc = (q,sp,tp)
eea q r sp sc tp tc = eea r (q `mod` r) sc (sp - qn * sc) tc (tp - qn * tc)
    where qn = div q r

main = putStrLn =<< fmap (unlines . map (eeShow . eeInit . map read . words) . tail) getLines

getLines :: IO [String]
getLines = do
  x <- getLine
  if x == ""
    then return []
    else fmap (x:) getLines
