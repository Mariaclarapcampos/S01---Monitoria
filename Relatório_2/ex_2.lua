print("Digite o valor de N:")
local n = tonumber(io.read())
local valores = {}

for i=1, n do
  valores[i] = tonumber(io.read())
end

local function maiorValor(tabela)
    local maior = tabela[1] -- assume que o primeiro é o maior inicialmente
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

print("O maior valor na tabela é: " .. maiorValor(valores))