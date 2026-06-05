-- Tipo Item
data Item = Item {
    nome      :: String,
    categoria :: String,
    preco     :: Double
} deriving (Show)

-- Tipo StatusCompra
data StatusCompra = Pendente | Concluida | Cancelada
    deriving (Show, Eq)

-- Tipo Compra
data Compra = Compra {
    itens  :: [Item],
    status :: StatusCompra
} deriving (Show)

-- Soma dos preços dos itens
totalItens :: [Item] -> Double
totalItens xs = sum (map preco xs)

-- Valor final da compra
valorFinal :: Compra -> Double
valorFinal (Compra xs st)
    | st == Cancelada = 0.0
    | total > 200     = total * 0.9
    | otherwise       = total
  where
    total = totalItens xs

-- Função principal
main :: IO ()
main = do
    let escudo = Item "Escudo de Metal" "Defesa" 80.0 
    let arco   = Item "Arco" "Arma" 50.0
    let espada = Item "Espada de Metal" "Arma" 100.0

    let compra1 = Compra [escudo, arco, espada] Concluida
    let compra2 = Compra [arco] Cancelada

    putStrLn $ "Compra 1 - Status: " ++ show (status compra1)
    putStrLn $ "Valor final: R$ " ++ show (valorFinal compra1)

    putStrLn $ "\nCompra 2 - Status: " ++ show (status compra2)
    putStrLn $ "Valor final: R$ " ++ show (valorFinal compra2)