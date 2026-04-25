module Localizavel
  def local_atual
    puts "#{@nome} está em #{@local}"
  end
end

module Perigoso
  def exibir_ameaca
    puts "Alerta! #{@nome} pode ser perigoso!"
  end
end

class Pessoa
  attr_accessor :nome, :local

  def initialize(nome, local)
    @nome = nome
    @local = local
  end
end

class Testemunha < Pessoa
  include Localizavel
end

class Suspeito < Pessoa
  include Localizavel
  include Perigoso
end

class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(pessoa)
    @pessoas << pessoa
  end

  def listar_todos
    @pessoas.each do |p|
      puts "Nome: #{p.nome}"
      p.local_atual if p.respond_to?(:local_atual)
    end
  end

  def identificar_perigosos
    @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }
  end
end

cena = CenaDoCrime.new

t1 = Testemunha.new("John Watson", "Baker Street")
s1 = Suspeito.new("James Moriarty", "Londres")
s2 = Suspeito.new("Irene Adler", "Mayfair")

cena.adicionar_pessoa(t1)
cena.adicionar_pessoa(s1)
cena.adicionar_pessoa(s2)

cena.listar_todos

perigosos = cena.identificar_perigosos
perigosos.each do |p|
  p.exibir_ameaca
end