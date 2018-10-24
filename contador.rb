module Contador
     
    attr_reader :maximo_necessario

    # redefinindo o metod .add()
    def <<(livro)
        push(livro)
        if @maximo_necessario.nil? || @maximo_necessario < size
            @maximo_necessario = size
        end
        self
    end
end