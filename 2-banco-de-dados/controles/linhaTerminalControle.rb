# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'terminal.rb'

# para cada linha, os terminais por quais passa
def listaTudoPorLinha
    linhas = Linha.all
    linhas.each do |lin|
        print "#{lin.nome} -> "
        terminais = lin.terminals
        terminais.each do |t|
            print "#{t.nome} "
        end
    end
end

# para cada terminal, as linhas que passam nele
def listaTudoPorTerminal
    terminais = Terminal.all
    terminais.each do |term|
        puts "#{term.nome}:"
        linhas = term.linhas
        linhas.each do |l|
            puts "    #{l.nome} "
        end
        puts ""
    end
end


# para dada linha, os terminais por quais passa
def listaLinhaTerminalPorLinha(linha)
    lin = Linha.find(linha) # usar funcao do linha Controle talvez
    linha
end


# para dado terminal, as linhas que passam nele