import Data.Char

-- 1ª questão
paraMaiuscula :: String -> String
paraMaiuscula str = [toUpper ch | ch <- str]

-- 2ª questão
divisores :: Integer -> [Integer]
divisores n 
      | n <= 0 = []
      | otherwise = [x | x <- [1..n], n `mod` x == 0]

isPrime :: Integer -> Bool
isPrime n 
      | length (divisores n) == 2 = True
      | otherwise = False

-- 4ª questão
menorValorLista :: [Int] -> Int
menorValorLista []                  = error "Lista Vazia"
menorValorLista [x]                 = x
menorValorLista (x:xs)
      | x < menorValorLista xs      = x
      | otherwise                   = menorValorLista xs

-- 5ª questão
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1 
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibTable :: Integer -> String
fibTable n = 
      let table = ["n fib n"] ++ [show i ++ " " ++ show (fibonacci i) | i <- [0..n]]
      in unlines table

-- 6ª questão
measure :: [a] -> Int
measure [] = -1
measure [x] = 1
measure (x:xs) = 1 + measure xs

measure2 :: [a] -> Int
measure2 l = if (null l) then -1 else length l

-- 6ª questão
takeFinal :: Int -> [a] -> [a]
takeFinal n l = drop (length l - n) l 
