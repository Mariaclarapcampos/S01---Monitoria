use std::io;

fn imprimir_multiplos(numero: i32, limite_inferior: i32, limite_superior: i32){
   for i in limite_inferior..=limite_superior {
        if i % numero == 0 {
            println!("{}", i);
        }
    }
}

fn main(){
    let mut numero = String::new();
    let mut lim_inferior = String::new();
    let mut lim_superior = String::new();

    println!("Digite o número da tabuada:");
    numero.clear();
    io::stdin().read_line(&mut numero).expect("Erro ao ler entrada");
    let numero: i32 = numero.trim().parse().expect("Digite um número válido");

  println!("Digite o limite inferior:");
    lim_inferior.clear();
    io::stdin().read_line(&mut lim_inferior).expect("Erro ao ler entrada");
    let lim_inferior: i32 = lim_inferior.trim().parse().expect("Digite um limite válido");
    
    println!("Digite o limite superior:");
    lim_superior.clear();
    io::stdin().read_line(&mut lim_superior).expect("Erro ao ler entrada");
    let lim_superior: i32 = lim_superior.trim().parse().expect("Digite um limite válido");
    
   println!("Múltiplos de {} entre {} e {}:", numero, lim_inferior, lim_superior);
   imprimir_multiplos(numero, lim_inferior, lim_superior);
}
