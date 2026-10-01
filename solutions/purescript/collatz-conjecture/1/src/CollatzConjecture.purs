module CollatzConjecture
  ( collatz
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Exception.Unsafe (unsafeThrow)

collatzAux :: Int -> Int
collatzAux 1 = 0
collatzAux n =
    if mod n 2 == 0 then
        1 + collatzAux (n / 2)
    else
        1 + collatzAux (3 * n + 1)

collatz :: Int -> Maybe Int
collatz n =
    if n <= 0 then
        Nothing
    else
        Just (collatzAux n)
