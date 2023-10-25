dobraLista = [x*2 | x <- [1,2,3,4]] -- Vai gerar uma lista em que os elementos são o dobro da lista passada como conjunto de x (x <- [])

-- [ (x,y) | x <- [1,2,3], y <- ['a','b'], x > 1, y /= 'a' ]
-- OUTPUT: [(2,'b'),(3,'b')]

dobraListaPar = [x*2 | x <- [1..10], mod x 2 == 0]

todosPares :: [Int] -> [Int]
todosPares l = [x | x <- l, mod x 2 == 0]

ehPar :: Int -> Bool
ehPar n = mod n 2 == 0

ehPar2 :: [Int] -> [Bool]                             -- Tipo com função (passando uma lista como parÂmetro no terminal)
ehPar2 listaInt = [mod x 2 == 0 | x <- listaInt]

listaBoolPar = [ehPar x | x <- [2,4..10]]             -- Tipo já passando uma lista no código

-- splitAt 3 [2,3,5,6,9]
-- OUTPUT: ([2,3,5],[6,9])

-- reverse [1..10]
-- OUTPUT: [10,9,8,7,6,5,4,3,2,1]

-- head [1..10]
-- OUTPUT: 1

-- tail [1..10]
-- OUTPUT: [2,3,4,5,6,7,8,9,10]

-- take 3 [2,3,4,5,6,7,8,9,10]
-- OUTPUT: [2,3,4]

-- replicate 2 [2,4,5,6,7]
-- OUTPUT: [[2,4,5,6,7],[2,4,5,6,7]]

-- 1 : (2 : [3,4])
-- OUTPUT: [1,2,3,4]

-- null [1]
-- OUTPUT: False

-- null []
-- OUTPUT: True

-- init [1,2,3,4,5]
-- OUTPUT: [1,2,3,4]

-- Caso Base: lista vazia [] == 0
-- Caso Recursivo: tem pelo menos um valor (ex.: 1 : []). A cada iteração, é tirado o valor do head da lista.
comprimentoListaInt :: [Int] -> Int
comprimentoListaInt [] = 0                                              
comprimentoListaInt (x:xs) = 1 + comprimentoListaInt xs

{-
[1,2,3]
= 1 : [2:3]
= 1 : (2 : [3])
= 1 : (2 : (3 : []))

-}

-- Calcula o tamanho de lista de uma lista com tipo geral, sem ser específico de um tipo. 
comprimentoLista :: [a] -> Int
comprimentoLista [] = 0                                              
comprimentoLista (x:xs) = 1 + comprimentoLista xs

-- Calcula os m ascendentes de um número n
asc :: Int -> Int -> [Int]
asc n m 
      | m < n = []
      | m == n = [m]
      | m > n = n : asc (n+1) m

-- Calcula a soma dos valores pares de uma dada lista passada como parâmetro
paresLista :: [Int] -> Int
paresLista [] = 0
paresLista (x:xs) 
      | mod x 2 == 0    = x + paresLista xs
      | otherwise       = paresLista xs

-- Devolve um booleano que diz se um elemento a está dentro de uma lista [a]
elemento :: (Eq a ) => a -> [a] -> Bool 
elemento _ [] = False
elemento e (x:xs) = (e==x) || elemento (e) xs

-- Remove elementos duplicados de uma dada lista, tendo como resultado a lista sem os valores duplicados.
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs) 
      | x `elemento` xs = nub xs
      | otherwise = x : nub xs

-- Devolve um booleano que confere se uma dada lista está em ordem crescente.
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

addLista :: [Integer] -> Integer
addLista []     = 0
addLista (x:xs) = x + addLista xs

produtoLista :: [Integer] -> Integer
produtoLista []     = 1
produtoLista (x:xs) = x * produtoLista xs

-- Devolve o valor head de uma lista [t]
mhead :: [t] -> t
mhead []          = error "Lista Vazia"
mhead (x:_)       = x

-- Devolve os valores de tail de uma dada lista [t]
mtail :: [t] -> [t]
mtail []          = error "Lista Vazia"
mtail (_:xs)      = xs

-- Devolve o segundo elemento de uma lista
segundoElem :: [t] -> t
segundoElem []          = error "Lista Vazia"
segundoElem [x]         = error "Lista de apenas um elemento"
segundoElem (x:y:_)     = y

-- Devolve o maior elemento de uma lista 
maiorValorLista :: [Int] -> Int
maiorValorLista []                  = error "Lista Vazia"
maiorValorLista [x]                 = x
maiorValorLista (x:xs)
      | x > maiorValorLista xs      = x
      | otherwise                   = maiorValorLista xs

-- Remove os n primeiros elementos de uma lista 
mdrop :: Int -> [Int] -> [Int]
mdrop _ []        = []
mdrop 0 l         = l
mdrop n (x:xs)
      | n >= 0    = mdrop (n-1) xs
      | otherwise = error "Não pode ser um valor negativo"

-- Devolve os n primeiros valores de uma lista 
mtake :: Int -> [Int] -> [Int]
mtake 0 _         = []
mtake _ []        = []
mtake n (x:xs)    = x : mtake (n-1) xs

mzip :: [a] -> [b] -> [(a,b)]
mzip (x:xs) (y:ys)      = (x,y) : mzip xs ys
mzip _ _                = []