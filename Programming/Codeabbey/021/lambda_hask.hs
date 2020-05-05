--Author lambda_hask
count x arr = length $ filter (==x) arr

main = do
    let x = [1..16]
    n <- getLine
    let arr = map read (words n)
    mapM_ (print . (`count` arr))  x
