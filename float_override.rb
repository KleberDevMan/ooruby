# sobreescrita de classe
class Float
    def para_dinheiro
      valor = "R$" << self.to_s.tr('.', ',')
      valor << "0" unless valor.match /(.*)(\d{2})$/
      valor
    end
end