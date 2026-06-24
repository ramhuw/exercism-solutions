module Deque (Deque, mkDeque, pop, push, shift, unshift) where
import Data.IORef

data Node a = Node {
    value :: a,
    prev :: IORef (Maybe (Node a)),
    next :: IORef (Maybe (Node a))
}

data Deque a = Deque {
    front :: IORef (Maybe (Node a)),
    back :: IORef (Maybe (Node a))
}

mkDeque :: IO (Deque a)
mkDeque = do 
    f <- newIORef Nothing 
    b <- newIORef Nothing
    pure Deque {
        front = f,
        back = b
    }

pop :: Deque a -> IO (Maybe a)
pop deque = do
    b <- readIORef $ back deque
    case b of
        Nothing ->
            pure Nothing
        Just oldBack -> do
            p <- readIORef $ prev oldBack
            case p of
                Nothing -> do
                    writeIORef (front deque) Nothing
                    writeIORef (back deque) Nothing
                Just newBack -> do
                    writeIORef (next newBack) Nothing
                    writeIORef (back deque) (Just newBack)
            pure $ Just $ value oldBack


push :: Deque a -> a -> IO ()
push deque x = do
    p <- readIORef $ back deque
    case p of
        Nothing -> do
            empty <- newIORef Nothing
            let newBack = Node { value = x, prev = empty, next = empty} in do
                writeIORef (front deque) (Just newBack)
                writeIORef (back deque) (Just newBack)
        Just oldBack -> do
            empty <- newIORef Nothing
            oldPointer <- newIORef (Just oldBack)
            let newBack = Node { value = x, prev = oldPointer, next = empty} in do
                writeIORef (next oldBack) (Just newBack)
                writeIORef (back deque) (Just newBack)
            

unshift :: Deque a -> a -> IO ()
unshift deque x = do
    p <- readIORef $ front deque
    empty <- newIORef Nothing
    case p of
        Nothing -> 
            let newFront = Node { value = x, prev = empty, next = empty } 
            in do
                writeIORef (front deque) (Just newFront)
                writeIORef (back deque) (Just newFront)
        Just oldFront -> do
            newPointer <- newIORef (Just oldFront)
            let newFront = Node { value = x, prev = empty, next = newPointer } in do
                writeIORef (prev oldFront) (Just newFront)
                writeIORef (front deque) (Just newFront)

shift :: Deque a -> IO (Maybe a)
shift deque = do
    p <- readIORef (front deque)
    empty <- newIORef Nothing
    case p of 
        Nothing ->
            pure Nothing
        Just oldFront -> do
            newFront <- readIORef (next oldFront)
            case newFront of
                Nothing -> do
                    writeIORef (front deque) Nothing
                    writeIORef (back deque) Nothing
                Just node -> do
                    writeIORef (prev node) Nothing
                    writeIORef (front deque) (Just node)
            pure $ Just $ value oldFront
    
