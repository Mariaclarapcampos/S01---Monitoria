using System;
using System.Collections.Generic;

namespace BibliotecaMiskatonic
{
    abstract class AbominacaoCosmica
    {
        public string Nome { get; set; }

        public AbominacaoCosmica(string nome)
        {
            Nome = nome;
        }

        public abstract void Manifestar();
    }

    class Shoggoth : AbominacaoCosmica
    {
        public Shoggoth(string nome) : base(nome) { }

        public override void Manifestar()
        {
            Console.WriteLine($"{Nome}: A massa de protoplasma se arrasta borbulhando, moldando órgãos e olhos conforme avança.");
        }
    }

    class CacadorAlado : AbominacaoCosmica
    {
        public CacadorAlado(string nome) : base(nome) { }

        public override void Manifestar()
        {
            Console.WriteLine($"{Nome}: A criatura bate suas asas membranosas, mergulhando do vácuo estelar em um voo silencioso.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<AbominacaoCosmica> horrores = new List<AbominacaoCosmica>();

            horrores.Add(new Shoggoth("Shoggoth"));
            horrores.Add(new CacadorAlado("Morte Alada"));

            foreach (var horror in horrores)
            {
                horror.Manifestar();
            }

            Console.ReadLine();
        }
    }
}
