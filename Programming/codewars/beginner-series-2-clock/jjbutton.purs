module Kata (past) where

import Prelude

msInSeconds :: Int -> Int
msInSeconds seconds = seconds * 1000

msInMinutes :: Int -> Int
msInMinutes minutes = msInSeconds $ minutes * 60

msInHours :: Int -> Int
msInHours hours = msInMinutes $ hours * 60

past :: Int -> Int -> Int -> Int
past h m s = msInHours h + msInMinutes m + msInSeconds s
