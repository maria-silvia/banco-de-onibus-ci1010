$:.push 'modelos/'
require 'terminal.rb'
require 'endereco.rb'

def imprimeTerminalE(ende)
    puts "#{ende.id} #{ende.nome} (#{ende.endereco.rua}, #{ende.endereco.numero})"
end

# -------------------- LISTA ---------------------
def listaTerminals(atributos)
    if atributos.empty?()
        listaTodosTerminals
    else
        ende = Terminal.where(atributos)
        ende.each do |t|
            imprimeTerminalE t
        end
    end
end
def listaTodosTerminals
    puts "Listando todos os Terminais de Ônibus:"
    Terminal.all.each do |t|
        imprimeTerminalE t
    end
end
