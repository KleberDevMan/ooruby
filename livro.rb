class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    
    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco(preco)
    end

    private
    def calcula_preco(base)
        if @ano_lancamento < 2000
            base * 0.7
        else
            base
        end
    end
end

livro_rails = Livro.new("Agile Web Development with Rails", 70.5, 2011)
livro_ruby = Livro.new("Programming Ruby 1.9", 60, 2010)
livro_algoritmos = Livro.new("Algoritmos", 100, 1998)

def imprime_nota_fiscal(livros)
    livros.each do |livro|
        puts "Titulo: #{livro.titulo} - #{livro.preco}"
    end
end
def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
    end
end

livros = [livro_rails, livro_ruby]

# imprime_nota_fiscal livros
livro_para_newsletter livro_algoritmos
