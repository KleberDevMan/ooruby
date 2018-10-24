require_relative "string_override"

class Livro
    attr_reader :titulo, :preco, :possui_reimpressao, :ano_lancamento, :editora
    
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
