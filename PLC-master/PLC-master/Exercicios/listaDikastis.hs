merge :: [Int] -> [Int] -> [Int]
merge [] a = a
merge b [] = b
merge (x:xs) (y:ys) 
      | x <= y = x : merge xs (y:ys)
      | otherwise = y : merge (x:xs) ys


halve :: [a] -> ([a], [a])
halve xs = (oddIndexes xs, evenIndexes xs)
  where
    oddIndexes  []       = []
    oddIndexes  (x:xs)   = x : evenIndexes xs

    evenIndexes []       = []
    evenIndexes (_:xs)   = oddIndexes xs

expNE :: Float -> Int -> Float
expNE n 0 = 1
expNE n k = n * expNE n (k-1)

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc 0 b = b
mdc a b = mdc b (mod a b)

f :: [Int] -> [Int]
f [] = []
f [x] = []
f (x:y:xs) 
      | x == y = x : f (y:xs)
      | otherwise = f (y:xs)

data Eletronico = Eletronico String Integer
      deriving (Show,Read)

infoEletronico :: Eletronico -> String
infoEletronico (Eletronico nome kWh) = "O dispositivo " ++ nome ++ " consome " ++ show kWh ++ " kWh."