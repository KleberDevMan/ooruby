require_relative "string_override"
require_relative "produto"

class EBook
    
    include Produto

    def initialize(titulo, preco, ano_lancamento, editora)
        c = ConversorString.new

        @titulo = c.string_para_alfanumerico(titulo)
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco(preco)
        @editora = editora

    end

    def matches?(query)
        ["ebook","digital"].include?(query)
    end

end
