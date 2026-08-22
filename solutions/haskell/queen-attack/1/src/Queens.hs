module Queens (boardString, canAttack) where
import Data.List (intersperse)

size :: Int
size = 8

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black =
    unlines [
       intersperse ' ' [if Just (i, j) == white then 'W'
        else
            if Just (i, j) == black then 'B'
            else '_' | j <- [0..(size - 1)] ] | i <- [0..(size - 1)]
    ]

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB =
    fst queenA == fst queenB || snd queenA == snd queenB || fst queenA - fst queenB == snd queenA - snd queenB || uncurry (+) queenA == uncurry (+) queenB
