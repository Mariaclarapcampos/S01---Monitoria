package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	}
	return false
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	for {
		fmt.Print("Usuário: ")
		usuario, _ := reader.ReadString('\n')
		usuario = strings.TrimSpace(usuario)

		fmt.Print("Senha: ")
		senha, _ := reader.ReadString('\n')
		senha = strings.TrimSpace(senha)

		if verificarLogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}