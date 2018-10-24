require_relative "string_override"
require_relative "produto"
require_relative "impresso"

class Revista < Produto

    include Impresso

    def initialize(titulo, preco, ano_lancamento, editora, possui_reimpressao, numero)
        
        super(titulo, preco, ano_lancamento, editora)

        @possui_reimpressao =  possui_reimpressao 
        @numero = numero
        
    end

    def matches?(query)
        ["revista","impresso"].include?(query)
    end
    
end
