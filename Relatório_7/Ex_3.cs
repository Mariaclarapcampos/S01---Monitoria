using System;
using System.Collections.Generic;

namespace FrierenApp
{
    class ReliquiaMagica
    {
        public string NomeItem { get; set; }

        public ReliquiaMagica(string nomeItem)
        {
            NomeItem = nomeItem;
        }
    }

    class BauDeReliquias
    {
        private List<ReliquiaMagica> reliquias = new List<ReliquiaMagica>();

        public void GuardarItem(ReliquiaMagica item)
        {
            reliquias.Add(item);
        }

        public void ListarReliquias()
        {
            Console.WriteLine("Relíquias guardadas no Baú:");
            foreach (var r in reliquias)
            {
                Console.WriteLine($"- {r.NomeItem}");
            }
        }
    }

    class ItemDeAcampamento
    {
        public string NomeItem { get; set; }

        public ItemDeAcampamento(string nomeItem)
        {
            NomeItem = nomeItem;
        }
    }

    class Maga
    {
        public string Nome { get; set; }
        public BauDeReliquias Bau { get; private set; }
        public List<ItemDeAcampamento> ItensDeAcampamento { get; set; }

        public Maga(string nome, List<ItemDeAcampamento> itensDeAcampamento)
        {
            Nome = nome;
            Bau = new BauDeReliquias();
            ItensDeAcampamento = itensDeAcampamento;
        }

        public void AdicionarReliquia(ReliquiaMagica reliquia)
        {
            Bau.GuardarItem(reliquia);
        }

        public void MostrarItensDeAcampamento()
        {
            Console.WriteLine($"{Nome} está utilizando os seguintes itens de acampamento:");
            foreach (var item in ItensDeAcampamento)
            {
                Console.WriteLine($"- {item.NomeItem}");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<ItemDeAcampamento> itens = new List<ItemDeAcampamento>
            {
                new ItemDeAcampamento("Saco de Dormir"),
                new ItemDeAcampamento("Pote de Cozinha")
            };

            Maga frieren = new Maga("Frieren", itens);

            frieren.AdicionarReliquia(new ReliquiaMagica("Anel de Prata"));
            frieren.AdicionarReliquia(new ReliquiaMagica("Grimório Antigo"));

            frieren.MostrarItensDeAcampamento();

            Console.WriteLine();
            frieren.Bau.ListarReliquias();

            Console.ReadLine();
        }
    }
}
