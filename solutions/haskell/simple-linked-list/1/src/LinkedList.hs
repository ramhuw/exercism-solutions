module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Empty | Node a (LinkedList a)
  deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Node x _) = x
datum Empty = error "No value"

fromList :: [a] -> LinkedList a
fromList [] = Empty
fromList (x : xs) = new x (fromList xs)

isNil :: LinkedList a -> Bool
isNil Empty = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x linkedList = Node x linkedList

next :: LinkedList a -> LinkedList a
next (Node _ n) = n 
next Empty = error "Empty list has no next"

nil :: LinkedList a
nil = Empty

append :: LinkedList a -> a -> LinkedList a
append Empty x = Node x Empty
append (Node y n) x = Node y (append n x)

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList Empty = Empty
reverseLinkedList (Node x n) = append (reverseLinkedList n) x

toList :: LinkedList a -> [a]
toList Empty = []
toList (Node x n) = x : (toList n)
