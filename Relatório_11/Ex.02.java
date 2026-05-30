import java.util.ArrayList;

class Cafe {
    private String nome;
    private double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double calcularPrecoFinal() {
        return preco;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPreco() + bonusAroma;
    }
}

//IA ajudou
class Menu {
    private ArrayList<Cafe> cafes;

    public Menu() {
        cafes = new ArrayList<>(); 
    }

    public void adicionarCafe(Cafe c) {
        cafes.add(c); 
    }

    public void exibirMenu() {
        for (Cafe c : cafes) { 
            System.out.println("Café: " + c.getNome() +
                               " - Preço final: R$ " + c.calcularPrecoFinal());
        }
    }
}


class CafeteriaLeblanc{
  //Ia ajudou com essa parte
  private Menu menu;
   public CafeteriaLeblanc() {
        menu = new Menu(); 
    }
//------------------------------------

    public void adicionarCafe(Cafe cafe) {
        menu.adicionarCafe(cafe); 
    }

    public void abrirCafeteria() {
        System.out.println("Bem vindo!");
        menu.exibirMenu();
    }
}

public class Main {
     public static void main(String[] args) {
        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();

        Cafe expresso = new Cafe("Expresso", 5.0);
        Cafe cappuccino = new Cafe("Cappuccino", 7.0);
        CafeGourmet gourmet = new CafeGourmet("Gourmet", 8.0, 2.5);

        leblanc.adicionarCafe(expresso);
        leblanc.adicionarCafe(cappuccino);
        leblanc.adicionarCafe(gourmet);

        leblanc.abrirCafeteria();
    }
}