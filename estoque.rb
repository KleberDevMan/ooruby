require_relative "contador"

class Estoque
 
    attr_reader :livros
    
    def initialize()
        @livros = []
        @vendas = []
        @livros.extend Contador
    end

    # ---------- 'livro/revista/ebook'... que mais vendeu por... 'titulo/quantidade/editora' -----------

    # quando um metodo nao é encontrado
    def method_missing(name)
        matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
        if matcher 
            tipo = matcher[1]
            campo = matcher[2].to_sym
            que_mais_vendeu_por(tipo, &campo)
        else
            super
        end
    end
    # diz se existe um metodo
    def respond_to?(name)
        matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)" || super 
        !!(matcher) || super
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











    private
    # conta a quantidade de ocorrencia de uma valor em um array de string
    def quantidade_de_vendas_por(produto, &campo)
        @vendas.count {|venda| campo.call(venda) == campo.call(produto)} 
    end
    
    # reorganiza o array de livro e retorna o ultimo
    def que_mais_vendeu_por(tipo, &campo)
        @vendas.select {|produto| produto.matches?(tipo)}.sort {|produto1,produto2|
            quantidade_de_vendas_por(produto1, &campo) <=> 
                quantidade_de_vendas_por(produto2, &campo)}.last
    end

end