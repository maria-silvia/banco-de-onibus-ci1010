# -*- coding: utf-8 -*-
$:.push 'modelos/'
require 'terminal.rb'
require 'linha.rb'

# assinala um terminal para todas as linhas
t1 = Terminal.find_by_nome("Cabral")
linhas = Linha.all
linhas.each do |linha|
  linha.terminals << t1
end

# assinala uma linha para todos os terminals
l1 = Linha.find_by_nome("Inter 2")
terminais = Terminal.all
terminais.each do |terminal|
  terminal.linhas << l1
end

l2 = Linha.find_by_nome("Interbairros III")
t2 = Terminal.find_by_nome("Sta Candida")
l2.terminals << t2
t2.linhas << l2