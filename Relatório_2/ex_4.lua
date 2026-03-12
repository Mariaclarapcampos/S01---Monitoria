local function soma(a, b)
    return a + b
end

local function subtracao(a, b)
    return a - b
end

local function multiplicacao(a, b)
    return a * b
end

local function divisao(a, b)
    if b == 0 then
        return "Erro: divisão por zero!"
    end
    return a / b
end

local function calculadora(a, b, operador)
    if operador == "+" then
        return soma(a, b)
    elseif operador == "-" then
        return subtracao(a, b)
    elseif operador == "*" then
        return multiplicacao(a, b)
    elseif operador == "/" then
        return divisao(a, b)
    else
        return "Erro: operador inválido!"
    end
end

io.write("Digite o primeiro número: ")
local num1 = tonumber(io.read())

io.write("\nDigite o segundo número: ")
local num2 = tonumber(io.read())

io.write("\nDigite o operador (+, -, *, /): ")
local op = io.read()

local resultado = calculadora(num1, num2, op)
print("\nResultado: " .. resultado)
