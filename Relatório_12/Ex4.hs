data Servico = Servico {
    nome     :: String,
    tipo     :: String,
    preco    :: Double
} deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    status   :: StatusAtendimento
} deriving (Show)

totalServicos :: [Servico] -> Double
totalServicos xs = sum (map preco xs)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento xs st)
    | st == Cancelado = 0.0
    | length xs > 3   = total * 1.25
    | otherwise       = total
  where
    total = totalServicos xs

primeiroServico :: Atendimento -> String
primeiroServico (Atendimento [] _)    = "Nenhum serviço no atendimento."
primeiroServico (Atendimento (s:_) _) = nome s

main :: IO ()
main = do
--Ia ajudou com os nomes
    let banhoRelaxante   = Servico "Banho Relaxante" "Higiene" 100.0
    let banhoErvas       = Servico "Banho de Ervas" "Terapêutico" 120.0
    let banhoEnergizante = Servico "Banho Energizante" "Revitalização" 90.0
    let banhoMistico     = Servico "Banho Místico" "Espiritual" 150.0

    let atendimento1 = Atendimento [banhoRelaxante, banhoErvas, banhoEnergizante, banhoMistico] Finalizado
    let atendimento2 = Atendimento [banhoRelaxante, banhoErvas] EmAndamento

    putStrLn $ "Atendimento 1 - Status: " ++ show (status atendimento1)
    putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento1)
    putStrLn $ "Primeiro serviço: " ++ primeiroServico atendimento1

    putStrLn $ "\nAtendimento 2 - Status: " ++ show (status atendimento2)
    putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento2)
    putStrLn $ "Primeiro serviço: " ++ primeiroServico atendimento2
