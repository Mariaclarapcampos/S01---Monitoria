Dim senha As Integer
Dim entrada As Integer

senha = 1234

Input "Digite a senha: ", entrada

If entrada <> senha Then
  Print "Senha incorreta. Tente novamente"
Else
  Print "Acesso liberado!"
End If

Sleep