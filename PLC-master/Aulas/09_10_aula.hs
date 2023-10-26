import Data.Char

ehPar :: Integer -> Bool
ehPar n = n `mod` 2 == 0

{-
somaLista :: [Integer] -> Integer
somaLista [] = 0
somaLista (x : xs) = x + somaLista xs

--1 

paraMaiuscula :: String -> String
paraMaiuscula str = [ toUpper ch |  ch <- str]

paraMaiuscula2 :: String -> String
paraMaiuscula2 str = [ toUpper ch |  ch <- str, isAlpha ch ]

--2
divisores :: Integer ->[Integer]
divisores n
 | n <=  0   = []
 | otherwise = [ x | x <- [1..n], n `mod` x == 0 ]

ehPrimo :: Integer -> Bool
--ehPrimo n = [1, n] ==  divisores n
ehPrimo n = length (divisores n) == 2

--3

menorLista :: [Int] -> Int
menorLista   []  = maxBound :: Int
menorLista   [x] = x
menorLista   (x:xs)
 | x < menorLista xs = x
 | otherwise = menorLista xs

menorLista2 :: [Int] -> Int
menorLista2 l 
 | l == []  = error "Lista vazia"
 | otherwise = mLista l
   where
  mLista   [x] = x
  mLista   (x:xs)
   | x < mLista xs = x
   | otherwise = mLista xs

-- 6
takeFinal :: Int -> [Int] -> [Int]
takeFinal n xs = drop  (length xs - n) xs

takeFinal2 :: Int -> [Int] -> [Int]
takeFinal2 0 xs = xs
takeFinal2 n (x:xs) = 

-}

primeiro :: (Int, Int) -> Int
primeiro (x,y) = x

extraiValor :: (Int, (Bool, Char)) -> Bool
extraiValor (n, (b, c)) = b

addPair :: [(Int, Int)] -> [Int]
addPair lPares = [ x+y | (x,y) <- lPares ]

somaLista :: [Int] -> Int
somaLista [] = 0                    -- caso base
somaLista (x:xs) = x + somaLista xs -- caso recursivo

paraMaiuscula :: String -> String
paraMaiuscula str = [ toUpper ch  | ch <- str ]

paraMaiuscula2 :: String -> String
paraMaiuscula2 str = [ toUpper ch  | ch <- str, isAlpha ch ]

divisores :: Integer -> [Integer]
divisores n
 | n <= 0 = []
 | otherwise = [ x | x <- [1 .. n], mod n x == 0 ]

ehPrimo :: Integer -> Bool
--ehPrimo n = [1, n] == divisores n
ehPrimo n = length(divisores n) == 2

menorLista :: [Int] -> Int
menorLista []  = error "Lista vazia" -- maxBound :: Int
menorLista [x] = x
menorLista (x:xs) 
 | x < menorLista xs  = x
 | otherwise          = menorLista xs

measure :: [a] -> Int
measure l = if (null l) then -1 else length l


takeFinal :: Int -> [Int] -> [Int]
takeFinal n l = drop (length l - n) l

