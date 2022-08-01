require './utils.rb'
$:.push 'modelos/'
require 'terminal.rb'
require 'endereco.rb'

def imprimeTerminalE(ende)
    puts "#{ende.id} #{ende.nome} (#{ende.endereco.rua}, #{ende.endereco.numero})"
end

# -------------------- LISTA ---------------------
def listaTerminals(atributos)
    begin
        registros = buscaTerminals atributos
    rescue NenhumRegistroError => e
        puts e.message
        return
    rescue VariosRegistros => e
        registros = e.registros
    end

    registros.each do |r|
        imprimeTerminalE r
    end
end
