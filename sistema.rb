require_relative "livro"
require_relative "float_override"
require_relative "estoque"

 
 livro_algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", "livro")
 livro_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "", "livro")
 livro_programmer = Livro.new("The Pragramtic Programmer", 100, 1999, true, "", "livro")
 livro_ruby = Livro.new("Programming Ruby", 100, 2004, true, "", "livro")
 revistona = Livro.new("Revista de Ruby", 10, 2012, true, "Revista", "revista")

 
 estoque = Estoque.new
 estoque << livro_algoritmos << livro_algoritmos << livro_ruby << livro_programmer << livro_arquitetura << livro_ruby << livro_ruby << revistona << revistona
 estoque.vende livro_ruby
 estoque.vende livro_algoritmos
 estoque.vende livro_algoritmos
 estoque.vende revistona

 puts estoque.livro_que_mais_vendeu_por_titulo.titulo
 puts estoque.revista_que_mais_vendeu_por_titulo.titulo
