module Kata (checkForFactor) where

import Prelude

checkForFactor :: Int -> Int -> Boolean
checkForFactor = (<<<) (eq 0) <<< mod
