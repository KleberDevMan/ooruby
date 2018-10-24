require_relative "string_override"
require_relative "produto"

class Livro
    
    include Produto

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, possui_sobrecapa)
        c = ConversorString.new

        @titulo = c.string_para_alfanumerico(titulo)
        @ano_lancamento = ano_lancamento
        @possui_reimpressao =  possui_reimpressao 
        @preco = calcula_preco(preco)
        @editora = editora
        @possui_sobrecapa = possui_sobrecapa

    end

    def matches?(query)
        ["livro","impresso"].include?(query)
    end

    def possui_reimpressao?
        @possui_reimpressao
    end
    
end
