import Data.List

primos :: [Int] -> [Int]
primos []     = []
primos (0:ns) = []
primos (1:ns) = []
primos (n:ns) = n:[ x | x <- primos ns, x `mod` n /= 0 ]

-- 2ª questão
sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (n:ns) = [n:ys | ys <- sublistas ns] ++ sublistas ns

-- 3ª questão
-- filtrarEinserir :: [[Int]] -> Int -> ([[Int]], Int)
-- filtrarEinserir [[]] _ =

-- 4ª questão
data Pilha t = Pilha [t] | PilhaVazia
            deriving Show

pushPilha :: t -> Pilha t -> Pilha t 
pushPilha t PilhaVazia = Pilha [t]
pushPilha t (Pilha x) = Pilha (t:x)

popPilha :: Pilha t -> Pilha t 
popPilha (PilhaVazia) = (PilhaVazia)
popPilha (Pilha (x:xs)) = (Pilha xs)

topPilha :: Pilha t -> t
topPilha (PilhaVazia) = error "Não existe nenhum elemento na pilha"
topPilha (Pilha (x:xs)) = x

-- 5ª questão
poli :: Integer -> Integer -> Integer -> (Integer -> Integer)
poli a b c = (\x -> (a * x * x) + (b * x) + c)

-- listaPoli :: [(Integer,Integer,Integer)] -> [Integer -> Integer]
-- listaPoli [(a,b,c)] = [n | ]

-- 6ª questão

data CInt = Conjunto [Int]
      deriving (Show)


makeSet :: [Int] -> CInt
makeSet = Conjunto . remDups . sort
 where
  remDups []     = []
  remDups [x]    = [x]
  remDups (x:y:xs) 
   | x < y     = x : remDups (y:xs)
   | otherwise = remDups (y:xs)

union ::  CInt -> CInt -> CInt
union (Conjunto xs) (Conjunto ys) = Conjunto (uni xs ys)

uni :: [Int] -> [Int] -> [Int]
uni [] ys        = ys
uni xs []        = xs
uni (x:xs) (y:ys) 
 | x<y     = x : uni xs (y:ys)
 | x==y    = x : uni xs ys
 | otherwise   = y : uni (x:xs) ys

mapSet :: (Int -> Int) -> CInt -> CInt
mapSet f (Conjunto xs) = makeSet (map f xs)

