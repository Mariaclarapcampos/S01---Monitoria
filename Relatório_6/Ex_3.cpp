#include <iostream>
using namespace std;

class MembroInatel {
protected:
    string nomeCompleto;

public:
    void setNome(string nome) {
        nomeCompleto = nome;
    }

    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " 
             << nomeCompleto << "." << endl;
    }
};

class Coordenador : public MembroInatel {
private:
    string departamento;

public:
    void setDepartamento(string dep) {
        departamento = dep;
    }

    void identificar() override {
        cout << "Meu nome é " << nomeCompleto 
             << ", sou o coordenador do departamento de " 
             << departamento << " no Inatel." << endl;
    }
};

class Pesquisador : public MembroInatel {
private:
    string laboratorio;

public:
    void setLaboratorio(string lab) {
        laboratorio = lab;
    }

    void identificar() override {
        cout << "Meu nome é " << nomeCompleto 
             << ", e realizo pesquisas no laboratório " 
             << laboratorio << " do Inatel." << endl;
    }
};

int main() {
    MembroInatel* m1;
    MembroInatel* m2;

    Coordenador c;
    c.setNome("Carlos Silva");
    c.setDepartamento("Engenharia");

    Pesquisador p;
    p.setNome("Ana Souza");
    p.setLaboratorio("Lab de IA");

    m1 = &c;
    m2 = &p;

    m1->identificar();
    m2->identificar();

    return 0;
}