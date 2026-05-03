module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin a b = Clock (mod (a + div b 60) 24) (mod b 60)

toString :: Clock -> String
toString (Clock a b) = s (show a) ++ ":" ++ s (show b)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Clock a b) = fromHourMin (hour + a) (min + b)

s :: String -> String
s "" = "00"
s [x] = '0' : [x]
s x = x