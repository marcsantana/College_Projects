import Control.Concurrent
import System.IO

ping :: Int -> MVar Int -> MVar () -> MVar Int -> IO ()
ping 0 _ _ _ = return ()
ping n pongSem pingSem messageNumber = do
    takeMVar pongSem -- Espera até que o sinal de "pong" seja recebido
    currentPing <- takeMVar messageNumber
    putStrLn $ "Ping: enviei mensagem " ++ show currentPing
    putMVar messageNumber (currentPing + 1) -- Incrementa o número da mensagem
    putMVar pingSem () -- Sinaliza que o "ping" enviou uma mensagem
    ping (n - 1) pongSem pingSem messageNumber

pong :: Int -> MVar Int -> MVar () -> MVar Int -> IO ()
pong 0 _ _ _ = return ()
pong n pongSem pingSem messageNumber = do
    putStrLn "Pong: esperando mensagem"
    takeMVar pingSem -- Espera até que o sinal de "ping" seja recebido
    currentPong <- takeMVar messageNumber
    putStrLn $ "Pong: recebi mensagem " ++ show currentPong
    putMVar messageNumber (currentPong + 1) -- Incrementa o número da mensagem
    putMVar pongSem currentPong -- Sinaliza que o "pong" recebeu a mensagem
    pong (n - 1) pongSem pingSem messageNumber

main :: IO ()
main = do
    putStrLn "Quantas mensagens deseja enviar?"
    n <- readLn

    pingSem <- newMVar ()
    pongSem <- newEmptyMVar
    messageNumber <- newMVar 1

    let pingThread = ping n pongSem pingSem messageNumber
    let pongThread = pong n pongSem pingSem messageNumber

    forkIO pingThread
    forkIO pongThread

    threadDelay (n * 1000) -- Aguarda até que todas as mensagens sejam processadas

    putStrLn "Programa encerrado."