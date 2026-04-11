#include <iostream>
#include <vector>
using namespace std;

class MembroConselho {
protected:
    string nome;

public:
    void setNome(string n) {
        nome = n;
    }

    virtual void saudar() {
        cout << "Um membro do conselho faz uma reverência silenciosa." << endl;
    }

    virtual ~MembroConselho() {}
};

class Anao : public MembroConselho {
public:
    void saudar() override {
        cout << "Pela força da montanha, eu sou " << nome 
             << " e honro nosso aço!" << endl;
    }
};

class Orc : public MembroConselho {
public:
    void saudar() override {
        cout << "Pelo sangue e glória, eu sou " << nome 
             << " e trago a força de minha tribo!" << endl;
    }
};

class Draconato : public MembroConselho {
public:
    void saudar() override {
        cout << "Pelo sopro dos ancestrais, eu sou " << nome 
             << " e falo em nome dos dragões!" << endl;
    }
};

int main() {
    vector<MembroConselho*> conselho;

    Anao a;
    a.setNome("Thorin");

    Orc o;
    o.setNome("Grom");

    Draconato d;
    d.setNome("Rhazor");

    conselho.push_back(&a);
    conselho.push_back(&o);
    conselho.push_back(&d);

    for (MembroConselho* membro : conselho) {
        membro->saudar();
    }

    return 0;
}