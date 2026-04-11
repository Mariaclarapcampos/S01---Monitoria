#include <iostream>
using namespace std;

class Robo {
private:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

public:
    Robo(string m, int v, float p, int i) {
        modelo = m;
        versao = v;
        potenciaLaser = p;
        integridade = i;
    }

    void disparar(Robo &alvo) {
        cout << modelo << " disparou em " << alvo.modelo << "!\n";
        
        alvo.integridade -= potenciaLaser;

        if (alvo.integridade < 0) {
            alvo.integridade = 0;
        }
    }

    void exibirStatus() {
        cout << "Modelo: " << modelo << endl;
        cout << "Versao: " << versao << endl;
        cout << "Potencia Laser: " << potenciaLaser << endl;
        cout << "Integridade: " << integridade << endl;
        cout << "--------------------------" << endl;
    }
};

int main() {
    Robo robo1("RX-78", 1, 30.5, 100);
    Robo robo2("ZX-99", 2, 25.0, 100);

    cout << "=== STATUS INICIAL ===\n";
    robo1.exibirStatus();
    robo2.exibirStatus();

    robo1.disparar(robo2);

    cout << "\n=== STATUS APOS ATAQUE ===\n";
    robo1.exibirStatus();
    robo2.exibirStatus();

    return 0;
}