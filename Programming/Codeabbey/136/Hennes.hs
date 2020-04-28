--Author Hennes
import Data.Maybe
import Numeric (readInt)
import Text.Printf
import Data.List.Split (chunksOf)
import Data.List (foldl', elemIndex, find)
import Data.Char (intToDigit)
import Numeric (showHex, showIntAtBase)

convertString = "0123456789ABCDEFGHIJKLMNOPQRSTUV"

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

testVector = "9GODO072MMLS8JIES2M2H2CU49I4K4M9O40SG04D01P092HP8E18B2H5604OQS2K1HG5P1DDE4H81KIM12DSOU82GS4LSC141P0TPMN2M94QBPH15IEKCJ88IKISKG3E18IKQNEEKS8P4N0LS855KOABN0BGCTGQOT8QGMO2QBJN6QSECQG90F1889KB6IUCESPM0K"

readVector s = foldl (++) "" $ map (\a -> printf "%05b" $ fromJust $ a `elemIndex` convertString) s

uncompressData :: String -> String
uncompressData [] = []
uncompressData s = fst (decodedChar s) : uncompressData (drop (length (snd $ decodedChar s)) s)
  where
    decodedChar f = fromJust $ find (\l -> snd l == take (length $ snd l) f) lookup_table
