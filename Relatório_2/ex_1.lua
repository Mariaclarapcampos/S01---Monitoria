print("Entre com M e N")
print("Digite o valor de M:")
local m = tonumber(io.read())
print("Digite o valor de N:")
local n = tonumber(io.read())

if m > n then
  print("Erro: M deve ser menor ou igual a N.")
    return
end

print("Digite outro valor que sera usado para calcular a tabuada:")
local x = tonumber(io.read())

for i = m, n do
    print(x .. " x " .. i .. " = " .. (x * i))
end