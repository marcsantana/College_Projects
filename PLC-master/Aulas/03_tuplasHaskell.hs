parInt :: (Int, Int)
parInt = (22, 33)

minAndMax :: Integer -> Integer -> (Integer, Integer)
minAndMax x y
 | x >= y    = (y, x)
 | otherwise = (x, y)

addPair :: (Integer, Integer) -> Integer
addPair (x,y) = x + y

addPair2 :: (Integer, Integer) -> Integer
addPair2 (0, y) = y
addPair2 (x, y) = x + y

shift :: ((Integer, Integer), Integer) -> (Integer, (Integer, Integer))
shift ((x,y),z) = (x, (y,z))

addPair3 :: (Integer, Integer) -> Integer
addPair3 p = fst p + snd p

fibStep :: (Integer, Integer) -> (Integer, Integer)
fibStep (u, v) = (v, u+v)

fibPair :: Integer -> (Integer, Integer)
fibPair n
 | n == 0 = (0, 1)
 | otherwise = fibStep (fibPair(n-1))

fastFib :: Integer -> Integer
fastFib n = fst (fibPair n) 

umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d - e, d + e)
  where
    d = -b / (2 *a)
    e = sqrt (b ^ 2 - 4.0 * a * c) / (2.0 * a)

raizes :: Float -> Float -> Float -> String
raizes a b c 
 | b ^ 2 ==  4.0 * a * c = show (umaRaiz a b c)
 | b ^ 2 >  4.0 * a * c = show f ++ " " ++ show s
 | otherwise = "nao hah raizes"
   where
    (f, s) = duasRaizes a b c
    -- f = fst (duasRaizes a b c)
    -- s = snd (duasRaizes a b c)

type Nome = String
type Idade = Int
type Fone = Int
type Pessoa = (Nome, Idade, Fone)

nome :: Pessoa -> Nome
nome (n, i, f) = n