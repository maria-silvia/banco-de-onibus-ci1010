# -*- coding: utf-8 -*-

require './utils.rb'
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
end

def listaTipos(atributos)
    begin
        tipos = buscaTipos(atributos)
    rescue NenhumRegistroError => e
        puts e.message
        return
    rescue VariosRegistros => e
        tipos = e.registros
    end

    tipos.each do |t|
        imprimeTipo t
    end
end

# -------------------- EXCLUSAO ---------------------
def excluiTipo(atributos)
    tipos = buscaTipos(atributos)
    tip = tipos.first    
    print "Destruindo  "
    imprimeTipo tip
    tip.destroy
    puts "Tipo destruido"
    
    rescue => e
        puts e.message
end

# -------------------- INCLUSAO ---------------------
def incluiTipo(atributos)
    novo = Tipo.new()
    novo.nome = atributos[:nome]
    novo.cor = atributos[:cor]
    if novo.invalid?
        printErro novo
    else
        novo.save
        puts("Registro criado com sucesso")
        imprimeTipo novo
    end
end

# -------------------- ALTERACAO ---------------------
def alteraTipo(atributos)
    if (!atributos[:id])
        puts "Por favor passar id do registro a ser alterado"
        return
    end

    l = Tipo.find(atributos[:id])
    l.nome = atributos[:nome] if atributos[:nome]
    l.cor = atributos[:cor] if atributos[:cor]
    l.save
    print "Registro atualizado: "
    imprimeTipo l

    rescue => e
        puts e.message
end