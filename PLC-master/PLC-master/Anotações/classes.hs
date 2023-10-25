findDifference :: (Eq a, Show a) => [a] -> [a] -> Maybe String
findDifference xs ys
    | length xs /= length ys = Just (show (length xs) ++ " /= " ++ show (length ys))
    | otherwise = findFirstDifference xs ys 0
  where
    findFirstDifference [] [] _ = Nothing
    findFirstDifference (x:xs) (y:ys) idx
        | x /= y = Just (show x ++ " /= " ++ show y)
        | otherwise = findFirstDifference xs ys (idx + 1)
    findFirstDifference _ _ _ = error "As listas devem ter o mesmo comprimento."

data Vetor = Vetor Integer Integer Integer
      deriving Show

instance Eq Vetor where
    (==) :: Vetor -> Vetor -> Bool
    (Vetor x1 y1 z1) == (Vetor x2 y2 z2) = (x1 == x2) && (y1 == y2) && (z1 == z2)

instance Num Vetor where
    (+) :: Vetor -> Vetor -> Vetor
    (Vetor x1 y1 z1) + (Vetor x2 y2 z2) = Vetor (x1 + x2) (y1 + y2) (z1 + z2)

    (-) :: Vetor -> Vetor -> Vetor
    (Vetor x1 y1 z1) - (Vetor x2 y2 z2) = Vetor (x1 - x2) (y1 - y2) (z1 - z2)

    (*) :: Vetor -> Vetor -> Vetor
    (Vetor x1 y1 z1) * (Vetor x2 y2 z2) = Vetor (y1 * z2 - z1 * y2) (z1 * x2 - x1 * z2) (x1 * y2 - y1 * x2)

    abs :: Vetor -> Vetor
    abs (Vetor x y z) = Vetor (abs x) (abs y) (abs z)

    signum :: Vetor -> Vetor
    signum (Vetor x y z) = Vetor (signum x) (signum y) (signum z)

    fromInteger :: Integer -> Vetor
    fromInteger n = Vetor (fromInteger n) (fromInteger n) (fromInteger n)

data ITree = ILeaf | INode Int ITree ITree
    deriving Show

instance Eq ITree where
    (==) :: ITree -> ITree -> Bool
   
    ILeaf == ILeaf = True
    
    (INode val1 left1 right1) == (INode val2 left2 right2) =
        val1 == val2 && left1 == left2 && right1 == right2
    
    _ == _ = False

