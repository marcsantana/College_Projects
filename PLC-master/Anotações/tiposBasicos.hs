-- Guardas
maxTres :: Integer -> Integer -> Integer -> Integer
maxTres x y z 
      | x >= y && x >= z      = x
      | y >= z                = y
      | otherwise             = z

in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci x = fibx
      where
            fibx = fibonacci (x-1) + fibonacci (x-2)

fatorial :: Integer -> Integer
fatorial 1 = 1                      -- Caso base
fatorial n = n * fatorial (n-1)     -- Caso recursivo

fatorial1 :: Integer -> Integer
fatorial1 n 
      | n == 1     = 1
      | otherwise = n * fatorial1 (n-1)

-- Fatorial Limitado: dado dois inteiros a e b, eu quero calcular o fatorial de a até chegar o limite b. Por exemplo, se a = 7 e b = 3, a função irá retornar o resultado de 7 * 6 * 5 * 4 * 3
      -- Suponhe-se que sempre a >= b!!
      -- Caso base (a == b): teremos a.
      -- Caso recursivo (a != b): faremos a fatorialLimitado (a-1) b

fatorialLimitado :: Integer -> Integer -> Integer
fatorialLimitado a b 
      | a == b = a
      | otherwise = a * fatorialLimitado (a-1) b

is_zero :: Integer -> Bool
is_zero 0 = True
is_zero _ = False

