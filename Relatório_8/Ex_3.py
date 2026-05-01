class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} com arma {self.arma}"


class Joker:
    def __init__(self, membros: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca")
        self.membros = membros

    def mostrar_equipe(self):
        print(f"Joker usa {self.arma}")
        print("Equipe dos Phantom Thieves:")
        for membro in self.membros:
            print(membro)


membros = [
    PhantomThieves("Ryuji", "Porrete"),
    PhantomThieves("Ann", "Chicote"),
    PhantomThieves("Morgana", "Estilingue")
]

joker = Joker(membros)
joker.mostrar_equipe()