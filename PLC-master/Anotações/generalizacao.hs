inc :: Int -> Int
inc n = n + 1

ehPar :: Int -> Bool
ehPar n = mod n 2 == 0


{-

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f v []   = v
foldl f v (x:xs)   = foldl f (f v x) xs

-}

twice :: (t -> t) -> (t -> t)
twice f = f . f 

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f) . f 

-- Notação Lambda
addNum :: Int -> (Int -> Int)
addNum n = (\m -> n + m)
