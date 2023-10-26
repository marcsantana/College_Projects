data Estacao = Inverno | Outono | Primavera | Verao

data Tempo = Frio | Quente
            deriving (Show)

clima :: Estacao -> Tempo
clima Inverno = Frio 
clima _ = Quente

data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab
      deriving (Eq, Ord, Enum, Show, Read)

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade 

showPessoa :: Pessoas -> String
showPessoa (Pessoa n i) = n ++ " " ++ show i 

data Shape = Circle Float
            | Rectangle Float Float


calculaArea :: Shape -> Float
calculaArea (Circle r) = pi * r * r
calculaArea (Rectangle b h) = b * h


data Expr = Lit Int
            | Add Expr Expr
            | Sub Expr Expr
            deriving (Show)

eval :: Expr -> Int 
eval (Lit n) = n 
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)

mshow :: Expr -> String
mshow (Lit n) = show n
mshow (Add e1 e2) = "(" ++ mshow e1 ++ " " ++ "+" ++ " " ++ mshow e2 ++ ")"
mshow (Sub e1 e2) = "(" ++ mshow e1 ++ " " ++ "-" ++ " " ++ mshow e2 ++ ")"

data Tree = NilT | Node Integer Tree Tree

sumTree :: Tree -> Integer
sumTree (NilT) = 0 
sumTree (Node a esq dir) = a + sumTree esq + sumTree dir

collapse :: Tree -> [Integer]
collapse (NilT) = []
collapse (Node a esq dir) = collapse esq ++ [a] ++ collapse dir

data Pairs t = Pair t t

data List t = Nil | Cons t (List t)
      deriving (Show)