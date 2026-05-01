from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante de {self.funcao} com custo {self.custo}"


class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} utiliza {self.implante} para invadir sistemas em Night City.")


class Faccao:
    def __init__(self, membros: list[Cibernetico]):
        self.membros = membros

    def executar_hacks(self):
        for membro in self.membros:
            membro.realizar_hack()


membros = [
    NetRunner("V", 5000, "Controle de Rede"),
    NetRunner("Alt Cunningham", 8000, "Manipulação de IA"),
    NetRunner("T-Bug", 6000, "Invasão de Segurança")
]

faccao = Faccao(membros)
faccao.executar_hacks()
