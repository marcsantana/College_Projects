-- 1ª questão
menorMaior :: Int -> Int -> Int -> (Int,Int)
menorMaior x y z = (menor,maior)
      where 
            menor = min a b 
                  where a = min x y
                        b = min y z 
            maior = max c d
                  where c = max x y 
                        d = max y z

-- 2ª questão
ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c)
    | a <= b && b <= c = (a, b, c)
    | a <= c && c <= b = (a, c, b)
    | b <= a && a <= c = (b, a, c)
    | b <= c && c <= a = (b, c, a)
    | c <= a && a <= b = (c, a, b)
    | otherwise       = (c, b, a)

-- 3ª questão
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

primeiraCoordenada :: Ponto -> Float
primeiraCoordenada (x,y) = x

segundaCoordenada :: Ponto -> Float
segundaCoordenada (x,y) = y

retaVertical :: Reta -> Bool
retaVertical ((x1,y1),(x2,y2)) = x1 == x2

-- 4ª questão
pontoY :: Float -> Reta -> Float
pontoY x ((x1, y1), (x2, y2)) =
    y1 + (x - x1) * (y2 - y1) / (x2 - x1)
