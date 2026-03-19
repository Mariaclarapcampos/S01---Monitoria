use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let npt = (nota1 + nota2)/2.0;
    let media = (npt * 0.7) + (nota3 * 0.3);

    if npt >= 60.0 && nota3 >= 60.0 {
        println!("Aprovado! Média final: {:.2}", media);
    } 
    else {
        println!("Reprovado! Média final: {:.2}", media);
    }

    media
}
  
fn main(){
    let mut n1 = String::new();
    let mut n2 = String::new();
    let mut n3 = String::new();

    println!("Digite a nota 1:");
    n1.clear();
    io::stdin().read_line(&mut n1).expect("Erro ao ler entrada");
    let n1: f64 = n1.trim().parse().expect("Digite um número válido");

     println!("Digite a nota 2:");
    n2.clear();
    io::stdin().read_line(&mut n2).expect("Erro ao ler entrada");
    let n2: f64 = n2.trim().parse().expect("Digite um número válido");
    
    println!("Digite a nota 3:");
    n3.clear();
    io::stdin().read_line(&mut n3).expect("Erro ao ler entrada");
    let n3: f64 = n3.trim().parse().expect("Digite um número válido");
    
    calcular_media(n1, n2, n3);
}