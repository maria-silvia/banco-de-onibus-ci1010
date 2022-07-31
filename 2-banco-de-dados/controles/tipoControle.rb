# -*- coding: utf-8 -*-

require './utils.rb'
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
end

def listaTipos(atributos)
    tipos = buscaTipo(atributos)
    tipos.each do |t|
        imprimeTipo t
    end
    rescue => e
        puts e.message
end

# -------------------- EXCLUSAO ---------------------
def excluiTipo(atributos)
    tip = Tipo.where(atributos)
    if !tip
        puts "Registro não encontrado"
        return
    end
    if tip.distinct.count > 1
        puts "Há #{tip.distinct.count} registros com esses atributos"
        return
    end
    tip = tip.first    
    print "Destruindo  "
    imprimeTipo tip
    tip.destroy
    puts "Tipo destroido"
end
