class Habilidade {
  usar() {
    throw new Error("O método 'usar' deve ser sobrescrito!");
  }
}

class Smoke extends Habilidade {
  usar() {
    console.log("Habilidade de Smoke: criando uma cortina de fumaça");
  }
}

class Flash extends Habilidade {
  usar() {
    console.log("Habilidade de Flash: cegando os inimigos com uma explosão de luz");
  }
}

class Dash extends Habilidade {
  usar() {
    console.log("Habilidade de Dash: avançando rapidamente para o combate");
  }
}

class Armadilha extends Habilidade {
  usar() {
    console.log("Habilidade de Armadilha: posicionando uma armadilha estratégica");
  }
}

class Agente {
  constructor(nome, funcao, habilidade) {
    this.nome = nome;
    this.funcao = funcao;
    this._habilidade = habilidade;
  }

  entrarEmCombate() {
    console.log(`Agente: ${this.nome} | Função: ${this.funcao}`);
    this._habilidade.usar();
  }
}

class Time {
  constructor(agentes) {
    this.agentes = agentes;
  }

  iniciarPartida() {
    this.agentes.forEach(agente => agente.entrarEmCombate());
  }

  listarControladores() {
    return this.agentes.filter(agente => agente._habilidade instanceof Smoke);
  }
}

const omen = new Agente("Omen", "Controlador", new Smoke());
const skye = new Agente("Skye", "Iniciador", new Flash());
const jett = new Agente("Jett", "Duelista", new Dash());
const cypher = new Agente("Cypher", "Sentinela", new Armadilha());

const timeValorant = new Time([omen, skye, jett, cypher]);

timeValorant.iniciarPartida();

const controladores = timeValorant.listarControladores();
console.log("Agentes Controladores:");
controladores.forEach(ctrl => console.log(ctrl.nome));