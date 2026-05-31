import java.util.ArrayList;

abstract class Monstro {
    String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void virarPrato();
}

class Lagosta extends Monstro {
    public Lagosta(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi cozinha a lagosta " + getNome());
    }
}

class Cogumelo extends Monstro {
    public Cogumelo(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi tempera o cogumelo " + getNome());
    }
}

class Tempero {
    private String nome;
    private int qtd;

    public Tempero(String nome, int qtd) {
        this.nome = nome;
        this.qtd = qtd;
    }

    public String getNome() {
        return nome;
    }

    public int getQtd() {
        return qtd;
    }
}

class Prato {
    private String nome;
    private Monstro monstro;
    private Tempero tempero;

    public Prato(String nome, Monstro monstro) {
        this.nome = nome;
        this.monstro = monstro;
        this.tempero = new Tempero("Pimenta", 10);
    }

    public void servir() {
        System.out.println("Prato: " + nome);
        monstro.virarPrato();
        System.out.println("Tempero usado: " + tempero.getNome() + " (quantidade: " + tempero.getQtd() + ")");
        System.out.println(" ");
    }
}

public class Main {
    public static void main(String[] args) {
        Monstro lagosta = new Lagosta("Lagosta");
        Monstro cogumelo = new Cogumelo("Cogumelo");

        Prato pratolagosta = new Prato("Lagosta Frita", lagosta);
        Prato pratocogumelo = new Prato("Sopa de Cogumelo", cogumelo);

        pratolagosta.servir();
        pratocogumelo.servir();

//IA ajudou
        ArrayList<Prato> cardapio = new ArrayList<>();
        cardapio.add(pratolagosta);
        cardapio.add(pratocogumelo);

        System.out.println("Cardápio da expedição:");
        for (Prato p : cardapio) {
            p.servir();
        }
    }
}