class Musico
  attr_accessor :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError, "#{self.class} deve implementar o método tocar_partitura."
  end
end

class Pianista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} está tocando a peça '#{obra}' no piano."
  end
end

class Violinista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} está tocando a peça '#{obra}' no violino."
  end
end

class Maestro
  attr_accessor :musicos

  def initialize(musicos = [])
    @musicos = musicos
  end

  def iniciar_concerto(obra)
    puts "Iniciando concerto: '#{obra}'"
    @musicos.each { |musico| musico.tocar_partitura(obra) }
  end

  def ajustar_postura(estado)
    @musicos.map { |musico| "#{musico.nome} está em ritmo #{estado}!" }
  end
end

obra = "Primavera de Vivaldi"

pianista = Pianista.new("Kosei Arima", "piano")
violinista = Violinista.new("Kaori Miyazono", "violino")

maestro = Maestro.new([pianista, violinista])

maestro.iniciar_concerto(obra)
puts maestro.ajustar_postura("Allegro")