# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
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
