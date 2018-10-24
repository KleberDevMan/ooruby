require_relative "string_override"
require_relative "produto"

class Revista
    
    include Produto

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
        c = ConversorString.new

        @titulo = c.string_para_alfanumerico(titulo)
        @ano_lancamento = ano_lancamento
        @possui_reimpressao =  possui_reimpressao 
        @preco = calcula_preco(preco)
        @editora = editora
        @numero = numero
        
    end

    def matches?(query)
        ["revista","impresso"].include?(query)
    end


    def possui_reimpressao?
        @possui_reimpressao
    end
    
end
