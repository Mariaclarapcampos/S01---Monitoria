use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 10 {
        return false;
    }

    let numeros = senha.chars().filter(|c| c.is_digit(10)).count();
    if numeros < 2 {
        return false;
    }

    let maiusculas = senha.chars().any(|c| c.is_ascii_uppercase());
    if !maiusculas {
        return false;
    }

    true
}

fn main() {
    loop {
        println!("Digite uma senha:");

        let mut senha = String::new();
        io::stdin()
            .read_line(&mut senha)
            .expect("Erro ao ler a entrada");

        let senha = senha.trim(); // remove espaços e quebra de linha

        if verificar_senha(senha) {
            println!("A senha é válida, seja bem vindo!");
            break;
        } else {
            println!("Senha inválida. Tente novamente.");
        }
    }
}