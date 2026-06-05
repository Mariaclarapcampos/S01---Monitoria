data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Double
} deriving (Show)


--IA ajudou
data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

data Pedido = Pedido {
    bebidas :: [Bebida],
    status  :: StatusPedido
} deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido bs st)
    | st == Cancelado = 0.0
    | otherwise       = sum (map preco bs)

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)          = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _)       = nome b

main :: IO ()
main = do
    let cafe = Bebida "Café Expresso" "Café" 5.0
    let cha  = Bebida "Chá Verde" "Chá" 4.5
    let suco = Bebida "Suco de Laranja" "Suco" 6.0

    let pedido1 = Pedido [cafe, cha] Entregue
    let pedido2 = Pedido [suco] Cancelado

    putStrLn $ "Pedido 1 - Status: " ++ show (status pedido1)
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido1
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido1)

    putStrLn $ "\nPedido 2 - Status: " ++ show (status pedido2)
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido2
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido2)
