-- Exercício 1
dobro :: Integer -> Integer
dobro n = n * 2

-- Exercício 2
quadruplo :: Integer -> Integer
quadruplo n = (dobro n) * 2

-- Exercício 3
poli2 :: Double -> Double -> Double -> Double -> Double
poli2 a b c x = (a * x^2) + (b * x) + c

-- Exercício 4
ehPar :: Integer -> Bool
ehPar x = mod x 2 == 0

parImpar :: Integer -> String
parImpar n 
      | ehPar n == True = "par"
      | otherwise = "impar"

-- Exercício 5

-- Primeira definição: escrita com base na função maxThree
maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c = max x c 
      where x = max a b

maxFour :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour a b c d = max (maxThree a b c) d


-- Segunda definição: escrita com base na função max
maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour2 a b c d = let max1 = max a b; max2 = max c d 
                  in max max1 max2

-- maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
-- maxFour2 a b c d = max x y 
--       where x = max a b
--             y = max c d

-- Exercício 6 
quantosIguais :: Integer -> Integer -> Integer -> Integer
quantosIguais a b c 
      | (a == b) && (b == c)  = 3 -- a = b = c
      | (a == b) && (b /= c)  = 2 -- a = b != c
      | (a == c) && (b /= c)  = 2 -- a = c != b
      | (b == c) && (a /= b)  = 2 -- b = c != a
      | otherwise             = 0 -- a != b != c

-- Exercício 7
ehZero :: Integer -> Bool
ehZero 0 = True
ehZero _ = False

-- Exercício 8
sumTo :: Integer -> Integer
sumTo 0 = 0
sumTo 1 = 1
sumTo n = n + sumTo (n-1)

-- Exercício 9
potencia :: Integer -> Integer -> Integer
potencia 0 k      = 0
potencia n 0      = 1
potencia n k      = n * potencia n (k-1)

-- Exercício 10
coeficienteBin :: Integer -> Integer -> Integer
coeficienteBin n 1 = 1
coeficienteBin 0 k = 0 
coeficienteBin n k = coeficienteBin (n-1) k + coeficienteBin (n-1) (k-1)

-- Exercício 12
addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos (n-1)

-- Exercício 13
paraDireita :: Int -> String -> String
paraDireita 0 x = x
paraDireita n k = addEspacos (n-1) ++ k