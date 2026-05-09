class Hunter {
  constructor(nome) {
    this.nome = nome;
  }

  lutar() {
    console.log(`${this.nome} está lutando de forma genérica.`);
  }
}

class Gon extends Hunter {
  lutar() {
    console.log(`${this.nome} usa Jajanken!`);
  }
}

class Killua extends Hunter {
  lutar() {
    console.log(`${this.nome} ativa Godspeed!`);
  }
}

class Kurapika extends Hunter {
  lutar() {
    console.log(`${this.nome} invoca suas Correntes!`);
  }
}

class TrupeFantasma {
  constructor(nome, membros) {
    this.nome = nome;
    this.membros = membros;
  }

  revelarMembros() {
    console.log(`Membros da ${this.nome}:`);
    this.membros.forEach(m => console.log(m));
  }
}

// Main
const gon = new Gon("Gon");
const killua = new Killua("Killua");
const kurapika = new Kurapika("Kurapika");

gon.lutar();
killua.lutar();
kurapika.lutar();

const trupe = new TrupeFantasma("Trupe Fantasma", ["Chrollo", "Hisoka", "Feitan"]);
trupe.revelarMembros();