# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'terminal.rb'

def listaLinhasTerminals(atributos)
    if atributos.empty?()
        listaTudoPorLinha
        puts ""
        listaTudoPorTerminal

    elsif atributos[:linha] && atributos[:terminal]
        lin = Linha.find(atributos[:linha])
        lin.terminals.each do |t|
            if t.id == atributos[:terminal].to_i
                puts "#{lin.nome} /  #{t.nome}" 
            end
        end
    elsif atributos[:linha]
        lin = Linha.find(atributos[:linha])
        listaTerminalPorLinha lin
    else
        term = Terminal.find(atributos[:terminal])
        listaLinhaPorTerminal term
    end
end

# para cada linha, os terminais por quais passa
def listaTudoPorLinha
    Linha.all.each do |l|
        listaTerminalPorLinha l
    end
end
def listaTerminalPorLinha(lin)
    puts "Linha #{lin.nome} passa em "
    lin.terminals.each do |t|
        puts "    #{t.nome} "
    end
end

# para cada terminal, as linhas que passam nele
def listaTudoPorTerminal
    Terminal.all.each do |term|
        listaLinhaPorTerminal term
    end
end    
def listaLinhaPorTerminal(term)
    puts "Em Terminal #{term.nome} passam as linhas"
    term.linhas.each do |l|
        puts "    #{l.nome} "
    end
end