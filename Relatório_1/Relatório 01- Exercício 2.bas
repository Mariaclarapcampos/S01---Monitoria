Dim senha As Integer
Dim entrada As Integer

senha = 1234

Do
  Input "Digite a senha: ", entrada
  
  If entrada <> senha Then
    Print "Senha incorreta. Tente novamente"
  End If
Loop Until entrada = senha

Print "Acesso liberado!"

Sleep
