require_relative "contador"

class Estoque
 
    attr_reader :livros
    
    def initialize()
        @livros = []
        @vendas = []
        @livros.extend Contador
    end

    
    # conta a quantidade de ocorrencia de uma valor em um array de string
    def quantidade_de_vendas_por(produto, &campo)
        @vendas.count {|venda| campo.call(venda) == campo.call(produto)} 
    end
    
    # reorganiza o array de livro e retorna o ultimo
    def livro_que_mais_vendeu_por(tipo, &campo)
        @vendas.select {|l| l.tipo == tipo}.sort {|produto1,produto2|
            quantidade_de_vendas_por(produto1, &campo) <=> 
                quantidade_de_vendas_por(produto2, &campo)}.last
    end
    
    # ---------- LIVRO -----------

    def livro_que_mais_vendeu_por_titulo
        livro_que_mais_vendeu_por("livro", &:titulo)
    end

    def livro_que_mais_vendeu_por_ano
        livro_que_mais_vendeu_por("livro", &:ano)
    end

    def livro_que_mais_vendeu_por_editora
        livro_que_mais_vendeu_por("livro", &:editora)
    end

    # ---------- REVISTA -----------

    def revista_que_mais_vendeu_por_titulo
        livro_que_mais_vendeu_por("revista", &:titulo)
    end

    def revista_que_mais_vendeu_por_ano
        livro_que_mais_vendeu_por("revista", &:ano)
    end

    def revista_que_mais_vendeu_por_editora
        livro_que_mais_vendeu_por("revista", &:editora)
    end

    # -------------------------------

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

    def vende(livro)
        @livros.delete livro
        @vendas << livro
    end

    def maximo_necessario 
        @livros.maximo_necessario
    end

    def length
        @livros.length
    end
end