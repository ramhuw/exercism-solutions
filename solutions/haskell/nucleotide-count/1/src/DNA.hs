module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right $ Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
nucleotideCounts (x : xs) = do
                              a <- f x
                              b <- nucleotideCounts xs
                              return $ Map.adjust (+ 1) a b
                            where 
                              f :: Char -> Either String Nucleotide
                              f 'A' = Right A
                              f 'C' = Right C
                              f 'G' = Right G
                              f 'T' = Right T
                              f err = Left "error"
