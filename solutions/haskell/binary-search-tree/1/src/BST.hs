module BST
  ( BST,
    bstLeft,
    bstRight,
    bstValue,
    empty,
    fromList,
    insert,
    singleton,
    toList,
  )
where

data BST a
  = Head
      { left :: BST a,
        right :: BST a,
        value :: a
      }
  | Empty
  deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Head l r v) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Head l r v) = Just r

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (Head l r v) = Just v

empty :: BST a
empty = Empty

fromList :: (Ord a) => [a] -> BST a
fromList [] = empty
fromList xs = insert (last xs) (fromList (init xs))

insert :: (Ord a) => a -> BST a -> BST a
insert x Empty =
  Head
    { value = x,
      left = Empty,
      right = Empty
    }
insert x (Head l r v)
  | x <= v = Head {value = v, left = insert x l, right = r}
  | otherwise = Head {value = v, left = l, right = insert x r}

singleton :: a -> BST a
singleton x =
  Head
    { value = x,
      left = Empty,
      right = Empty
    }

toList :: BST a -> [a]
toList Empty = []
toList (Head l r v) = toList l ++ [v] ++ toList r
