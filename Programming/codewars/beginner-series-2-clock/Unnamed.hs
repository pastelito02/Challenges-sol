--Unnamed
module Kata (past) where

past :: Int -> Int -> Int -> Int
past h m s = ((h * 60 + m) * 60 + s) * 1000
