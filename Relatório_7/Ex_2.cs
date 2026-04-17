using System;
using System.Collections.Generic;

namespace Ex_1
{
    class Pokemon
    {
        public string Especie { get; set; }

        public Pokemon(string especie)
        {
            Especie = especie;
        }
    }

    class CriaturaPokemon : Pokemon
    {
        public CriaturaPokemon(string especie) : base(especie) { }

        public virtual void ExecutarMovimento()
        {
            Console.WriteLine($"{Especie} executa um ataque genérico!");
        }
    }

    class TipoFogo : CriaturaPokemon
    {
        public TipoFogo(string especie) : base(especie) { }

        public override void ExecutarMovimento()
        {
            Console.WriteLine($"{Especie} lança uma rajada de chamas!");
        }
    }

    class TipoAgua : CriaturaPokemon
    {
        public TipoAgua(string especie) : base(especie) { }

        public override void ExecutarMovimento()
        {
            Console.WriteLine($"{Especie} dispara uma bolha de água!");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<CriaturaPokemon> pokemons = new List<CriaturaPokemon>();

            pokemons.Add(new TipoFogo("Scorbunny"));
            pokemons.Add(new TipoAgua("Greninja"));

            foreach (var p in pokemons)
            {
                p.ExecutarMovimento();
            }

            Console.ReadLine();
        }
    }
}
