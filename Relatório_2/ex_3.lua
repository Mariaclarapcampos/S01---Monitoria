print("Digite a quantidade de valores:")
local n = tonumber(io.read())
local valores = {}

for i = 1, n do
  io.write("Digite o valor " .. i .. ": ")
  valores[i] = tonumber(io.read())
end

local function filtrarImpares(tabela)
    local impares = {}
    for i = 1, #tabela do
        if tabela[i] % 2 ~= 0 then
            table.insert(impares, tabela[i])
        end
    end
    return impares
end

local novaTabela = filtrarImpares(valores)

print("\nNúmeros ímpares encontrados:")
for i, v in ipairs(novaTabela) do
    print(v)
end