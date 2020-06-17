--Author MrSossaa
import System.IO
import Control.Monad

processfile :: Handle -> IO()
processfile ifile =
  do
    iseof <- hIsEOF ifile
    Control.Monad.unless iseof $
      do
        line <- hGetLine ifile
        let vector_ints = map read $ words line :: [Double]
        let p = head vector_ints
        let r = (vector_ints!!1 / 100) / 12
        let l = vector_ints!!2
        let mes = round(p*(r*(1+r)**l) / ((1+r)**l-1))
        print mes
        processfile ifile

main =
  do
    ifile <- openFile "DATA.lst" ReadMode
    processfile ifile
    hClose ifile