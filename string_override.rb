# sobreescrita de classe
class ConversorString
    def string_para_alfanumerico(nome)
        nome.gsub /[^\w\s]/,''
    end
end