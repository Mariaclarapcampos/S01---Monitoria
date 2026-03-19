use std::io;

// Função que retorna true se o número for ímpar
fn eh_impar(numero: i32) -> bool {
    numero % 2 != 0
}

fn main() {
    let mut escolha = String::new();
    let mut entrada = String::new();
    
    // Jogador 1 escolhe par ou ímpar
    println!("Jogador 1, escolha 'par' ou 'impar':");
    io::stdin().read_line(&mut escolha).expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();
    
    // Jogador 1 digita um número
    println!("Jogador 1, digite um número inteiro:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let num1: i32 = entrada.trim().parse().expect("Digite um número válido");

    // Jogador 2 digita um número
    println!("Jogador 2, digite um número inteiro:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let num2: i32 = entrada.trim().parse().expect("Digite um número válido");
    
    // Calcula a soma e verifica se é ímpar
    let soma = num1 + num2;
    let resultado = eh_impar(soma);

    println!("Soma: {}", soma);
    println!("A soma é ímpar? {}", resultado);

    // Determina o vencedor
    if (escolha == "impar" && resultado) || (escolha == "par" && !resultado) {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}