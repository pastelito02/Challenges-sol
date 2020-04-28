--Auhtor Hennes
import Data.Maybe
import Numeric (readInt)
import Text.Printf
import Data.List.Split (chunksOf)
import Data.List (foldl')
import Data.Char (digitToInt)

lookup_table = [
    (' ', "11"),             ('e', "101"),
    ('t', "1001"),           ('o', "10001"),
    ('n', "10000"),          ('a', "011"),
    ('s', "0101"),           ('i', "01001"),
    ('r', "01000"),          ('h', "0011"),
    ('d', "00101"),          ('l', "001001"),
    ('!', "001000"),         ('u', "00011"),
    ('c', "000101"),         ('f', "000100"),
    ('m', "000011"),         ('p', "0000101"),
    ('g', "0000100"),        ('w', "0000011"),
    ('b', "0000010"),        ('y', "0000001"),
    ('v', "00000001"),       ('j', "000000001"),
    ('k', "0000000001"),     ('x', "00000000001"),
    ('q', "000000000001"),   ('z', "000000000000")]

expandString s = if length s `mod` 8 == 0 then s else expandString (s ++ "0")

readBinary = foldl' (\acc x -> acc * 2 + digitToInt x) 0

main = do
    inputText <- getLine
    let bitString = expandString $ foldl (++) "" $ map(\l -> fromJust $ lookup l lookup_table) inputText
    let values = map(readBinary) (chunksOf 8 bitString) :: [Int]
    let result = unwords $ map(printf "%02X") $ map(readBinary) (chunksOf 8 bitString)
    putStrLn result
