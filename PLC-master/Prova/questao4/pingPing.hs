import Control.Concurrent
import System.IO

ping :: Int -> MVar Int -> MVar Int -> IO ()
ping 0 _ _ = return ()
ping n pingCount pongCount = do
    threadDelay 10000 -- Aguarda 10ms entre envios
    currentPingCount <- takeMVar pingCount
    putStrLn $ "Ping: enviei " ++ show currentPingCount
    putMVar pongCount currentPingCount
    ping (n - 1) pingCount pongCount

pong :: Int -> MVar Int -> MVar Int -> IO ()
pong 0 _ _ = return ()
pong n pingCount pongCount = do
    currentPongCount <- takeMVar pongCount
    putStrLn $ "Pong: recebi " ++ show currentPongCount
    putMVar pingCount (currentPongCount + 1)
    pong (n - 1) pingCount pongCount

main :: IO ()
main = do
    putStrLn "Digite a quantidade de mensagens que quer enviar: "
    n <- readLn
    pingCount <- newMVar 1
    pongCount <- newMVar 1
    let pingThread = ping n pingCount pongCount
    let pongThread = pong n pingCount pongCount
    forkIO pingThread
    forkIO pongThread
    threadDelay (n * 11000) -- Aguarda até que todas as mensagens sejam processadas
    putStrLn "Programa encerrado."
