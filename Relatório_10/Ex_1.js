class Pokemon {
  constructor(nome, tipo) {
    this.nome = nome;
    this.tipo = tipo;
    this._vida = 100;
  }

  get vida() {
    return this._vida;
  }

  atacar() {
    console.log(`${this.nome} atacou de forma genérica!`);
  }

  receber_dano(valor) {
    if (valor < 0) return;
    this._vida -= valor;
    if (this._vida < 0) this._vida = 0;
    console.log(`${this.nome} recebeu ${valor} de dano!`);
  }
}

class Pikachu extends Pokemon {
  atacar() {
    console.log(`${this.nome} usou Choque do Trovão ⚡!`);
  }
}

class Charizard extends Pokemon {
  atacar() {
    console.log(`${this.nome} usou Lança-Chamas 🔥!`);
  }
}

const pikachu = new Pikachu("Pikachu", "Elétrico");
const charizard = new Charizard("Charizard", "Fogo");

pikachu.atacar();
charizard.atacar();

charizard.receber_dano(30);

console.log(`Vida restante de ${charizard.nome}: ${charizard.vida}`);