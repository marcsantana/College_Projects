-- Função normal
somaQuadrados :: Int -> Int -> Int
somaQuadrados x y = let quadX = x * x; quadY = y * y 
                        in quadX + quadY

-- Função Recursiva
fatorial :: Int -> Int
fatorial 0 = 1                      -- caso base  
fatorial n = fatorial (n-1) * n     -- caso recursivo

fatorial2 :: Int -> Int
fatorial2 n 
      | n == 0      = 1
      | otherwise   = fatorial2 (n-1) * n




fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fibonacci :: Int -> Int
fibonacci n 
      | n == 0    = 0
      | n == 1    = 1
      | otherwise = fibonacci (n-1) + fibonacci (n-2)

resto :: Integer -> Integer -> Integer
resto m n 
      | m < n     = m
      | otherwise = resto (m-n) n

vendas :: Int -> Int 
vendas 0 = 23
vendas 1 = 12 
vendas 2 = 89 
vendas 3 = 34

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = vendas n + totalVendas (n-1)