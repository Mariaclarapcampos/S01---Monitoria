import java.util.*;
import java.util.ArrayList;

abstract class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public int getIdade() { return idade; }

    public abstract void apresentar();
}

//IA ajudou
class Mago extends Personagem {
    public Mago(String nome, int idade) {
        super(nome, idade); 
    }

    @Override
    public void apresentar() {
        System.out.println("Sou o mago " + getNome() +
                           ", tenho " + getIdade() + " anos " +
                           "e posso manipular poderosas ilusões!");
    }
}

class Divisao {
    private String nome;
    private String funcao;

    public Divisao(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }

    public String getNome() { return nome; }
    public String getFuncao() { return funcao; }
}

//IA ajudou
class CasteloAnimado {
    private ArrayList<Divisao> divisoes;

    public CasteloAnimado(ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }

    public void adicionarDivisao(Divisao d) {
        divisoes.add(d);
    }

    public void listarDivisoes() {
        for (Divisao d : divisoes) {
            System.out.println("Divisão: " + d.getNome() + " - Função: " + d.getFuncao());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Mago howl = new Mago("Howl", 27);
        howl.apresentar();

        Divisao quarto = new Divisao("Quarto", "Dormir");
        Divisao sala = new Divisao("Sala", "Assistir TV");
        Divisao cozinha = new Divisao("Cozinha", "Comer");

        ArrayList<Divisao> listaDivisoes = new ArrayList<>();
        listaDivisoes.add(quarto);
        listaDivisoes.add(sala);
        listaDivisoes.add(cozinha);

        CasteloAnimado castelo = new CasteloAnimado(listaDivisoes);
        castelo.listarDivisoes();
    }
}