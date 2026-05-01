class BebidaAfterlife
  def initialize(nome, custo_base)
    @nome = nome
    self.custo_base = custo_base  
  end

  def nome
    @nome
  end

  def nome=(novo_nome)
    @nome = novo_nome
  end

  def custo_base
    @custo_base
  end

  def custo_base=(valor)
    if valor.is_a?(Numeric) && valor > 0
      @custo_base = valor
    else
      puts "Erro: custo deve ser maior que zero!"
    end
  end

  def preco_total
    custo_base
  end

  def to_s
    "Bebida: #{@nome} | Valor Final: $#{preco_total}"
  end
end

class DrinkIconico < BebidaAfterlife
  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)
    @nivel_notoriedade = nivel_notoriedade
  end

  def preco_total
    custo_base + (@nivel_notoriedade * 8)
  end

  def to_s
    "Drink Icônico: #{@nome} | Notoriedade: #{@nivel_notoriedade} | Valor Final: $#{preco_total}"
  end
end

drink1 = DrinkIconico.new("Johnny Silverhand", 50, 10)
drink2 = DrinkIconico.new("Rogue", 40, 7)
drink3 = DrinkIconico.new("V", 60, 12)

lista = [drink1, drink2, drink3]

lista.each do |drink|
  puts drink
end