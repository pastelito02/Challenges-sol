--Author Hennes
import Data.List
import Data.Maybe

tunes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

factor = 16.351597831287414

note2Freq s = round $ factor * 2 ** ((fromIntegral(fromJust $ elemIndex (init s) tunes)) / 12.0) * 2 ^ (read $ [last s])

main = putStrLn =<< fmap (unwords . map (show . note2Freq) . words . last . lines) getContents
