$:.push 'modelos/'
require 'terminal.rb'
require 'enderecos.rb'

def imprimeTerminalE(term)
    puts "#{term.nome} (#{term.endereco.rua} #{term.endereco.numero})"
end

def listaTudo
    term = Terminal.all
    term.each do |t|
        imprimeTerminalE t
    end
end
