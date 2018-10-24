require_relative "string_override"

class EBook
    attr_reader :titulo, :preco, :ano_lancamento, :editora
    
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

    def to_csv
        "#{@titulo}, - Data: #{@ano_lancamento} - R$ #{@preco}"
    end

    private
    def calcula_preco(base)
        if @ano_lancamento < 2016
            base * 0.95
        else
            if @ano_lancamento <= 2010
                base * 0.95
            else
                base
            end
        end
    end
end
