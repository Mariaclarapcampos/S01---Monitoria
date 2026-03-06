Dim nota1 As Double
Dim nota2 As Double
Dim nota3 As Double
Dim peso1 As Integer
Dim peso2 As Integer
Dim peso3 As Integer

Input "Digite a nota 1 e seu peso: ", nota1, peso1
Input "Digite a nota 2 e seu peso: ", nota2, peso2
Input "Digite a nota 3 e seu peso: ", nota3, peso3

Dim media As Double
media = ((nota1*peso1) + (nota2*peso2) + (nota3*peso3)) / (peso1 + peso2 + peso3)

If media >= 70 Then
   Print "Aprovado Direto"
Else
   Print "Reprovado Direto"
End If

Sleep