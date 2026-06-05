data Banda = Banda {
    nome   :: String,
    genero :: String,
    cache  :: Double
} deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    status :: StatusEvento
} deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento bs st)
    | st == Cancelado = 0.0
    | otherwise       = total * 1.2
  where
    total = sum (map cache bs)

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _)    = "Nenhuma banda no evento."
bandaAbertura (Evento (b:_) _) = nome b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda no evento."
bandaEncerramento (Evento bs _) = nome (last bs)

main :: IO ()
main = do
    let rock   = Banda "Stone Wolves" "Rock" 500.0
    let jazz   = Banda "Blue Horizon Quartet" "Jazz" 400.0
    let pop    = Banda "Neon Dreams" "Pop" 350.0
    let reggae = Banda "Sunrise Vibes" "Reggae" 450.0

    let evento1 = Evento [rock, jazz, pop] Ativo
    let evento2 = Evento [pop, reggae] Encerrado
    let evento3 = Evento [jazz] Cancelado

    putStrLn $ "Evento 1 - Status: " ++ show (status evento1)
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento evento1)
    putStrLn $ "Banda de abertura: " ++ bandaAbertura evento1
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento evento1

    putStrLn $ "\nEvento 2 - Status: " ++ show (status evento2)
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento evento2)
    putStrLn $ "Banda de abertura: " ++ bandaAbertura evento2
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento evento2

    putStrLn $ "\nEvento 3 - Status: " ++ show (status evento3)
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento evento3)
    putStrLn $ "Banda de abertura: " ++ bandaAbertura evento3
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento evento3