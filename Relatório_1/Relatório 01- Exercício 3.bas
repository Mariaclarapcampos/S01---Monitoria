Dim valor As double

Input "Digite o valor(em reais): ", valor

Dim conv_euro As double
Dim conv_dollar As double

conv_euro = valor / 5.40
conv_dollar = valor / 5.00

Print "Valor em reais:", valor
Print "Valor em euros:", conv_euro
Print "Valor em dolares:", conv_dollar

Sleep
