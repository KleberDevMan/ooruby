class Conversor
    def string_para_alfanumerico(nome)
        nome.gsub /[^\w\s]/,''
    end
end
# sobreescrita de classe
class Float
    def para_dinheiro
      valor = "R$" << self.to_s.tr('.', ',')
      valor << "0" unless valor.match /(.*)(\d{2})$/
      valor
    end
  end
class Livro
    attr_reader :titulo, :preco, :ano_lancamento, :possui_reimpressao
    
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        c = Conversor.new
        @titulo = c.string_para_alfanumerico titulo
        @ano_lancamento = ano_lancamento
        @possui_reimpressao =  possui_reimpressao 
        @preco = calcula_preco(preco)
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    def to_csv
        "#{@titulo}, - Data: #{@ano_lancamento} - R$ #{@preco}"
    end

    private
    def calcula_preco(base)
        if @ano_lancamento < 2016
            if @possui_reimpressao
                base * 0.9
            else
                base * 0.95
            end
        else
            if @ano_lancamento <= 2010
                base * 0.95
            else
                base
            end
        end
    end
end
# sobreescrita de classe
class Array
   attr_reader :maximo_necessario
end
module Contador
    
    attr_reader :maximo_necessario

    # redefinindo o metod .add()
    def <<(livro)
        push(livro)
        if @maximo_necessario.nil? || @maximo_necessario < size
            @maximo_necessario = size
        end
        self
    end
end
class Estoque

    attr_reader :livros
    
    def initialize()
        @livros = []
        @livros.extend Contador
    end

    def exporta_csv()
        @livros.each do |livro|
            puts livro.to_csv
        end
    end

    def mais_barato_que(valor)
        @livros.select do |livro|
            livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def <<(livro) 
        @livros << livro if livro
        self
    end

    def remove(livro)
        @livros.delete livro
    end

    def maximo_necessario 
        @livros.maximo_necessario
    end

    def length
        @livros.length
    end
end

livro_algoritmos = Livro.new("Algoritmos", 100, 1998, true)
livro_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
livro_programmer = Livro.new("The Pragramtic Programmer", 100, 1999, true)
livro_ruby = Livro.new("Programming Ruby", 100, 2004, true)

puts ">>> array de livros - descobrir o tamanho maximo que o array atingiu  <<<"
estoque = Estoque.new
estoque << livro_algoritmos 
estoque << livro_arquitetura 
estoque << livro_programmer
estoque << livro_ruby

estoque.remove livro_algoritmos
estoque.remove livro_arquitetura
puts "tamanho atual -> #{estoque.length}"
puts "tamanho maximo atingido -> #{estoque.livros.maximo_necessario}" 

puts "\n\n>>> array de numeros - descobrir o tamanho maximo que o array atingiu <<<"
nubmers = []
nubmers.extend Contador
nubmers << 13
nubmers << 15
nubmers << 17 << 19
puts nubmers.maximo_necessario

puts "\n\n>>> replace de Titulos c/ caracter -> Titulos s/ caracter <<<"
livro_algoritmos = Livro.new("Algoritmos^/", 100, 1998, true)
puts "#{livro_algoritmos.titulo}"

puts "\n\n>>> convertendo formato Float -> Preco <<<"
precos = [30.00, 40.00, 70.00, 59.00]
puts precos.to_s
precos_strign = []
precos.each do |preco|
    puts preco.class
    precos_strign << preco.para_dinheiro
end
puts precos_strign.to_s

puts "\n\n>>> contando o numero de coisas distintas dentro de um array <<<"
livros_computacao = ["livro de computacao 1", "livro de computacao 2", "livro que repete", "livro que repete"]
# sobreescrita de classe
class Array
    def metodo_novo
        "'open classes' -> alterar/introduzir novas responsabilidades a uma classe"
    end
end
# sobreescrita de metodo
def livros_computacao.length
    unique = []
    self.each do |item|
        unique.push(item) unless unique.include?(item)
    end
    unique.length
end
puts "livros de computacao = #{livros_computacao.length}"
puts "usando o #{livros_computacao.metodo_novo}"