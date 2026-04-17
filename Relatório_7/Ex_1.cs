using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Ex_1
{
    class CombatenteAliado
    {
        private string nome;
        private string linhagem;
        private string patente;

        public CombatenteAliado(string nome, string linhagem, string patente)
        {
            this.nome = nome;
            this.linhagem = linhagem;
            this.patente = patente;
        }

        public void ApresentarUnidade()
        {
            Console.WriteLine($"Nome: {nome}, Linhagem: {linhagem}, Patente: {patente}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            CombatenteAliado humanoCapitao = new CombatenteAliado("Aragorn", "Humano", "Capitão");
            CombatenteAliado anaoGuerreiro = new CombatenteAliado("Gimli", "Anão", "Guerreiro");
            CombatenteAliado elfoArqueiro = new CombatenteAliado("Legolas", "Elfo", "Arqueiro");

            humanoCapitao.ApresentarUnidade();
            anaoGuerreiro.ApresentarUnidade();
            elfoArqueiro.ApresentarUnidade();

            Console.ReadLine();
        }
    }
}