class Livro
    attr_reader :titulo, :preco, :ano_lancamento, :possui_reimpressao
    
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao 
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
class Estoque
    attr_reader :livros
    def initialize()
        @livros = []
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

    def adiciona(livro) 
        @livros << livro if livro
    end
end
# sobreescrita de classe
class Array
    attr_reader :maximo_necessario

    def <<(livro)
        push(livro)
        if @maximo_necessario.nil? || @maximo_necessario < size
            @maximo_necessario = size
        end
        self
    end

end

livro_algoritmos = Livro.new("Algoritmos", 100, 1998, true)
livro_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
livro_programmer = Livro.new("The Pragramtic Programmer", 100, 1999, true)
livro_ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new
estoque.livros << livro_algoritmos 
puts estoque.livros.maximo_necessario
estoque.livros << livro_arquitetura
puts estoque.livros.maximo_necessario
estoque.livros << livro_programmer
puts estoque.livros.maximo_necessario
estoque.livros << livro_ruby
puts estoque.livros.maximo_necessario

estoque.livros.delete livro_algoritmos
puts estoque.livros.maximo_necessario