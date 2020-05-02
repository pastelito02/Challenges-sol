--Author qaaperson
foo :: (Num a, Eq a, Show a) => [a] -> String
foo (a:b:c:[]) =
   show (foo1 a b c) ++ []
foo (a:b:c:abc) =
   show (foo1 a b c) ++ " " ++ foo abc

foo1 :: (Num a, Eq a) => a -> a -> a  -> a
foo1 a b 0 = 0
foo1 a b c = a + foo1 (a + b) b (c - 1)


main =
   print $ foo [16, 20, 58,
               5, 4, 94,
               23, 17, 10,
               10, 19, 57,
               3, 9, 38,
               17, 3, 74,
               11, 3, 89,
               14, 18, 36,
               2, 12, 13,
               16, 8, 37,
               14, 19, 35]
