--Author Hennes
calculate [d, b] = round $ d * tan((b-90) / 180 * pi)

main = putStrLn =<< fmap (unwords . map (show . calculate . map(read) . words).  tail . lines) getContents
