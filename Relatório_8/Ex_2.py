from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ergue uma barreira impenetrável para proteger seus aliados!")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} dispara uma ofensiva devastadora contra os inimigos!")


herois = [
    Tanque("Reinhardt"),
    Dano("Soldado: 76")
]

for heroi in herois:
    heroi.usar_ultimate()