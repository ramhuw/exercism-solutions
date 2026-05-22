module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n =
  let n0 = if n .&. 1 /= 0 then ["wink"] else []
      n1 = if n .&. 2 /= 0 then ["double blink"] else []
      n2 = if n .&. 4 /= 0 then ["close your eyes"] else []
      n3 = if n .&. 8 /= 0 then ["jump"] else []
      n4 = if n .&. 16 /= 0 then True else False
      nn = n0 ++ n1 ++ n2 ++ n3
   in if n4 then reverse nn else nn
