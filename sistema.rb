require_relative "livro"
require_relative "revista"
require_relative "ebook"
require_relative "float_override"
require_relative "estoque"

 # livros
 livro_algoritmos = Livro.new("Algoritmos", 100, 1998, true, "editora livro", true)
 livro_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "editora livro", true)
 livro_programmer = Livro.new("The Pragramtic Programmer", 100, 1999, true, "editora livro", true)
 livro_ruby = Livro.new("Programming Ruby", 100, 2004, true, "editora livro", false)

 # revistas
 revistona = Revista.new("Revista de Ruby", 10, 2012, true, "editora revista", 3)

 # e-book
 ebook_arquitetura = EBook.new("Revista de Ruby", 10, 2012, "editora ebook")
 
 estoque = Estoque.new
 estoque << livro_algoritmos << livro_algoritmos << livro_ruby << livro_programmer << livro_arquitetura << livro_ruby << livro_ruby << revistona << revistona << ebook_arquitetura
 estoque.vende livro_ruby
 estoque.vende livro_algoritmos
 estoque.vende livro_algoritmos
 estoque.vende revistona
 estoque.vende ebook_arquitetura

 puts estoque.livro_que_mais_vendeu_por_titulo.titulo
 puts estoque.revista_que_mais_vendeu_por_titulo.titulo
 puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
 puts estoque.respond_to?(:ebook_que_mais_vendeu_por_titulo)