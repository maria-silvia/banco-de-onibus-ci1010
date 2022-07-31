# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
end

def buscaTipo(atributos) 
    t = Tipo.all
    t = t.where(nome: atributos[:nome]) if atributos[:nome]
    t = t.where(cor: atributos[:cor]) if atributos[:cor]
    if t.empty? 
        puts("Tipo não encontrado")
    end
    return t
end

def listaTipos(atributos)
    tip = buscaTipo(atributos)
    tip.each do |t|
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
