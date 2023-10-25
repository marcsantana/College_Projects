import Control.Concurrent
import Control.Monad
import Data.List

data Estacionamento = Estacionamento
    { totalVagas :: Int
    , vagasPCD   :: Int
    , vagasDisponiveis   :: [Int]
    , vagasOcupadas    :: [(Int, Int, Bool, Int)] -- (vaga, carro, é PCD?, tempo ocupação)
    , tempoAtual :: Int
    }

iniciarEstacionamento :: Int -> Int -> Estacionamento
iniciarEstacionamento n k = Estacionamento
    { totalVagas = k
    , vagasPCD = n `div` 10
    , vagasDisponiveis = [1..k]
    , vagasOcupadas = []
    , tempoAtual = 0
    }


adicionarCarro :: MVar Estacionamento -> Int -> Bool -> IO ()
adicionarCarro estacionamentoMVar numeroCarro ehPCD = do
    estacionamento <- takeMVar estacionamentoMVar
    if null (vagasDisponiveis estacionamento)
        then putStrLn $ "Carro " ++ show numeroCarro ++ " não encontrou vaga."
        else do
            let (vaga:restoVagas) = vagasDisponiveis estacionamento
                novasOcupadas = (vaga, numeroCarro, ehPCD, tempoAtual estacionamento) : vagasOcupadas estacionamento
                novasDisponiveis = restoVagas
                novoTempo = tempoAtual estacionamento + if ehPCD then 1500 else 1000
                novoEstacionamento = estacionamento
                    { vagasDisponiveis = novasDisponiveis
                    , vagasOcupadas = novasOcupadas
                    , tempoAtual = novoTempo
                    }
            putStrLn $ "Carro " ++ show numeroCarro ++ " estacionou na vaga " ++ show vaga ++
                       " no instante de tempo " ++ show (tempoAtual novoEstacionamento)-- ++ " eh PCD? " ++ show ehPCD
            putMVar estacionamentoMVar novoEstacionamento

removerCarro :: MVar Estacionamento -> Int -> IO ()
removerCarro estacionamentoMVar numeroCarro = do
    estacionamento <- takeMVar estacionamentoMVar
    let infoCarro = find (\(_, carro, _, _) -> carro == numeroCarro) (vagasOcupadas estacionamento)
    case infoCarro of
        Just (vaga, _, ehPCD, inicioTempo) -> do
            let novasOcupadas = filter (\(_, carro, _, _) -> carro /= numeroCarro) (vagasOcupadas estacionamento)
                novasDisponiveis = if ehPCD then vaga : vagasDisponiveis estacionamento else vagasDisponiveis estacionamento ++ [vaga]
                tempoOcupacao = tempoAtual estacionamento - inicioTempo
                novoTempo = tempoAtual estacionamento + 1000 + tempoOcupacao
                novoEstacionamento = estacionamento
                    { vagasDisponiveis = novasDisponiveis
                    , vagasOcupadas = novasOcupadas
                    , tempoAtual = novoTempo
                    }
            putStrLn $ "Carro " ++ show numeroCarro ++ " saiu da vaga " ++ show vaga ++
                       " no instante de tempo " ++ show (tempoAtual novoEstacionamento)
            putMVar estacionamentoMVar novoEstacionamento
        Nothing -> putStrLn $ "Carro " ++ show numeroCarro ++ " não encontrado no estacionamento."


main :: IO ()
main = do
    putStrLn "Informe o número total de vagas (N):"
    n <- readLn
    putStrLn "Informe o número de carros (K):"
    k <- readLn

    let estacionamento = iniciarEstacionamento n k
    estacionamentoMVar <- newMVar estacionamento

    -- Verificar e imprimir a quantidade de vagas PCD
    -- let quantidadeVagasPCD = vagasPCD estacionamento
    -- putStrLn $ "Quantidade de vagas PCD: " ++ show quantidadeVagasPCD

    forM_ [1..k] $ \numeroCarro -> do
        ehPCD <- if numeroCarro <= (k * 4) `div` 20 then return True else return False
        forkIO $ adicionarCarro estacionamentoMVar numeroCarro ehPCD

    forM_ [1..k] $ \numeroCarro -> do
        forkIO $ removerCarro estacionamentoMVar numeroCarro

    threadDelay (k * 2000 + 10000)
