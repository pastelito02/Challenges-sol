--Author gsou859
points 0 pts _ _ _ _ = reverse pts
points n pts@(y:x:_) velx vely w h = points (n-1) (newy:newx:pts) (if newx == w || newx == 0 then velx * (-1) else velx ) (if newy == h || newy == 0 then vely * (-1) else vely ) w h
  where newx = x+velx
      newy = y+vely

initpoints (w:h:l:[]) = points 100 [0,0] 1 1 (w-l) (h-1)

main = do
  fmap (unwords . map show . initpoints . map read . words) getLine >>= putStrLn
