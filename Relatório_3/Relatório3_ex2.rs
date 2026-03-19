use std::io;

fn eh_impar(numero: i32) -> bool {
    numero % 2 != 0
}

fn main() {
    let mut escolha = String::new();
    let mut entrada = String::new();
    
    println!("Jogador 1, escolha 'par' ou 'impar':");
    io::stdin().read_line(&mut escolha).expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();
    
    println!("Jogador 1, digite um número inteiro:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let num1: i32 = entrada.trim().parse().expect("Digite um número válido");

    println!("Jogador 2, digite um número inteiro:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let num2: i32 = entrada.trim().parse().expect("Digite um número válido");
    
    let soma = num1 + num2;
    let resultado = eh_impar(soma);

    println!("Soma: {}", soma);
    println!("A soma é ímpar? {}", resultado);

    if (escolha == "impar" && resultado) || (escolha == "par" && !resultado) {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}