#include <iostream>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    void setNome(string n) {
        nome = n;
    }

    void setIdade(int i) {
        idade = i;
    }

    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    void setNivel(int n) {
        nivel = n;
    }

    int getNivel() {
        return nivel;
    }
};

class Personagem : public Pessoa {
private:
    int rank; //de 0 a 10

public:
    void setRank(int r) {
        if (r >= 0 && r <= 10) {
            rank = r;
        } else {
            rank = 0; 
        }
    }

    int getRank() {
        return rank;
    }
};

int main() {
    Protagonista p1;
    p1.setNome("Maria");
    p1.setIdade(17);
    p1.setNivel(25);

    Personagem p2;
    p2.setNome("João");
    p2.setIdade(17);
    p2.setRank(7);

    cout << "=== PROTAGONISTA ===" << endl;
    cout << "Nome: " << p1.getNome() << endl;
    cout << "Idade: " << p1.getIdade() << endl;
    cout << "Nivel: " << p1.getNivel() << endl;

    cout << "\n=== PERSONAGEM ===" << endl;
    cout << "Nome: " << p2.getNome() << endl;
    cout << "Idade: " << p2.getIdade() << endl;
    cout << "Rank: " << p2.getRank() << endl;

    return 0;
}