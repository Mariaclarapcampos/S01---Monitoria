import java.util.ArrayList;
import java.util.HashMap;

interface Rastreavel{
  String obterCoordenadas();
}

class Poder {
    private String nome;
    private int intensidade;

    public Poder(String nome, int intensidade) {
        this.nome = nome;
        this.intensidade = intensidade;
    }

    public String getNome() {
        return nome;
    }

    public int getIntensidade() {
        return intensidade;
    }
}

class Entidade {
    private String nome;

    public Entidade(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Alien extends Entidade implements Rastreavel {
    private Poder poder;

    public Alien(String nome, String nomePoder, int intensidade) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidade);
    }

    @Override
    public String obterCoordenadas() {
        return "Coordenadas do Alien " + getNome() + ": [X=120, Y=60]";
    }
}

class Youkai extends Entidade implements Rastreavel { //Deus o livre, que nomezinho dificil 
    private Poder poder;

    public Youkai(String nome, String nomePoder, int intensidade) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidade);
    }

    @Override
    public String obterCoordenadas() {
        return "Coordenadas do Youkai " + getNome() + ": [X=45, Y=200]";
    }
}

//Ia ajudou
class RegistroOculto {
    private HashMap<String, Entidade> entidades;

    public RegistroOculto() {
        entidades = new HashMap<>();
    }

    public void registrarEntidade(Entidade e) {
        if (entidades.containsKey(e.getNome())) {
            System.out.println("Entidade " + e.getNome() + " já registrada!");
        } else {
            entidades.put(e.getNome(), e);
            System.out.println("Entidade " + e.getNome() + " registrada com sucesso.");
        }
    }

    public void listarEntidades() {
        for (Entidade e : entidades.values()) {
            if (e instanceof Rastreavel) {
                Rastreavel r = (Rastreavel) e;
                System.out.println(e.getNome() + " -> " + r.obterCoordenadas());
            }
        }
    }
}
//------------------------------------------------------------------

public class Main {
     public static void main(String[] args) {
         RegistroOculto registro = new RegistroOculto();

        Alien alien1 = new Alien("Zorg", "Telepatia", 80);
        Alien alien2 = new Alien("Buzz", "Ácido", 90);
        Youkai youkai1 = new Youkai("Wood", "Fogo", 70);
        Youkai youkai2 = new Youkai("Jessie", "Força", 95);

        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);


        System.out.println("Lista de entidades registradas:");
        registro.listarEntidades();
     }
}