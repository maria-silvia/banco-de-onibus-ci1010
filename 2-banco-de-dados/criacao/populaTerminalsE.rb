# -*- coding: utf-8 -*-
$:.push 'modelos/'
require 'terminal.rb'
require 'endereco.rb'


lista = 
  [
   {:nome => "Cabral", :rua => "Av Parana", :numero => "500"        },
   {:nome => "Capão da Imbuia", :rua => "Av Presidente", :numero => "987"     },
   {:nome => "Sta Candida", :rua => "Av Parana", :numero => "1"        },
   {:nome => "Boa Vista", :rua => "Av Parana", :numero => "1000"        },
  ]

lista.each do |e|
  term = Terminal.new()
  term.nome = e[:nome]
  e = Endereco.new({:rua => e[:rua], :numero => e[:numero]})
  term.endereco = e
  e.save
  term.save
end
