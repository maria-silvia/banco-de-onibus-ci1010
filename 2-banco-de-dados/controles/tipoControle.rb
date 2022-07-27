# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
    tipo.linhas.each do |l|
        puts "    #{l.codigo} #{l.nome}"
    end
end

def listaTipos(atributos)
    if atributos.empty?()
        listaTodos
    else
        tip = Tipo.where(atributos)
        tip.each do |t|
            imprimeTipo t
        end
    end
end
def listaTodos
    puts "Listando todas os tipos de Ônibus:"
    Tipo.all.each do |t|
        imprimeTipo t
    end
end



# def deleta
#     # deleta todas as linhas com o tipo
# end
