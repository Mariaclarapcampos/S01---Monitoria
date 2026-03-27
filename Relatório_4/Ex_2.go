package main

import "fmt"

func main() {
	var num1, num2, num3 int

	fmt.Print("Digite 3 números: ")
	fmt.Scan(&num1, &num2, &num3)

	if num1+num2 > num3 && num1+num3 > num2 && num2+num3 > num1 {

		switch {
		case num1 == num2 && num2 == num3:
			fmt.Println("É Equilátero")

		case num1 == num2 || num1 == num3 || num2 == num3:
			fmt.Println("É Isósceles")

		default:
			fmt.Println("É Escaleno")
		}

	} else {
		fmt.Println("Erro: Não é possível formar um triângulo!")
	}
}