Maria Clara Pereira Campos - 503
haskell

EXERCÍCIO 1 Exercício 1 — Café Leblanc No Café Leblanc, Sojiro anota cada pedido feito durante o dia. Cada bebida tem um nome, um tipo e um preço. Ao final, ele precisa saber o valor total do pedido. Defina o tipo Bebida com os campos nome, tipo e preco. Crie um tipo StatusPedido com os construtores Aberto, Entregue e Cancelado. Crie o tipo Pedido com uma lista de bebidas e um StatusPedido. Implemente valorTotalPedido :: Pedido -> Double que soma os preços das bebidas. Use guards para retornar 0.0 se o pedido estiver Cancelado, e o total simples nos demais casos. Implemente primeiraBebida :: Pedido -> String usando pattern matching na lista de bebidas — retorne o nome da primeira ou uma mensagem caso a lista esteja vazia. Na main, crie dois pedidos com bebidas diferentes, um Entregue e um Cancelado, e exiba o valor total de cada um.



eu ja declarei as váriaveis, me ajude com o resto
data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Double
} deriving (Show)

REsposta:
Perfeito, Maria! Você já declarou o tipo Bebida. Agora vamos completar o exercício com os outros tipos e funções:
-- Tipo StatusPedido
data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

-- Tipo Pedido
data Pedido = Pedido {
    bebidas :: [Bebida],
    status  :: StatusPedido
} deriving (Show)

-- Função para calcular o valor total do pedido
valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido bs st)
    | st == Cancelado = 0.0
    | otherwise       = sum (map preco bs)

-- Função para obter a primeira bebida
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)    = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b

-- Função principal
main :: IO ()
main = do
    -- Bebidas já declaradas
    let cafe = Bebida "Café Expresso" "Café" 5.0
    let cha  = Bebida "Chá Verde" "Chá" 4.5
    let suco = Bebida "Suco de Laranja" "Suco" 6.0

    -- Dois pedidos: um entregue e um cancelado
    let pedido1 = Pedido [cafe, cha] Entregue
    let pedido2 = Pedido [suco] Cancelado

    putStrLn $ "Pedido 1 - Status: " ++ show (status pedido1)
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido1
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido1)

    putStrLn $ "\nPedido 2 - Status: " ++ show (status pedido2)
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido2
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedido2)
O que foi feito:
StatusPedido: construtores Aberto, Entregue e Cancelado.
Pedido: lista de bebidas e status.
valorTotalPedido: usa guards para retornar 0.0 se Cancelado.
primeiraBebida: usa pattern matching para pegar o nome da primeira bebida ou mensagem se vazio.
main: cria dois pedidos e mostra resultados.
👉 Quer que eu te mostre também como deixar o programa mais interativo, pedindo que o usuário digite as bebidas e o status na execução, em vez de usar valores fixos?
me de 4 estilos musicais e o nome das bandas aleatórios
Resposta:
Aqui vão quatro estilos musicais bem variados com nomes de bandas aleatórios:
Rock → Stone Wolves
Jazz → Blue Horizon Quartet
Pop → Neon Dreams
Reggae → Sunrise Vibes
me de 4 tipos de banho, seu tipo e seu preço

Aqui estão quatro tipos de banho com seus respectivos tipos e preços:
Banho Relaxante → Tipo: Higiene | Preço: R$ 100.0
Banho de Ervas → Tipo: Terapêutico | Preço: R$ 120.0
Banho Energizante → Tipo: Revitalização | Preço: R$ 90.0
Banho Místico → Tipo: Espiritual | Preço: R$ 150.0


FEEDBACK:
O feedbck que a Ia deu foi bom, já que me ajudou, principalmente o primeiro que foi o que me ajudou a entender a estrutura e como funcionam os codigos em HASKELL. Esse feedback foi o que me permitiu realizar os outros exercicios, ja que seguem a mesma estrutura.
