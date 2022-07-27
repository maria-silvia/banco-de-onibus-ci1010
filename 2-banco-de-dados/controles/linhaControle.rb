# -*- coding: utf-8 -*-
require './utils.rb'
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeLinha(lin)
    puts "#{lin.id} #{lin.codigo} #{lin.nome} - #{lin.tipo.nome} (#{lin.tipo.cor})"
end

# -------------------- LISTA ---------------------
def listaLinhas(atributos)
    if atributos.empty?()
        listaTodasLinhas
    else
        lin = Linha.where(atributos)
        lin.each do |l|
            imprimeLinha l
        end
    end
end
def listaTodasLinhas
    puts "Listando todas as Linhas de Ônibus:"
    Linha.all.each do |l|
        imprimeLinha l
    end
end

# -------------------- INCLUSAO ---------------------
def incluiLinha(atributos)
    lin = Linha.new()
    lin.nome = atributos[:nome]
    lin.codigo = atributos[:codigo]
    
    t = Tipo.all
    t = t.where(nome: atributos[:tipo_nome]) if atributos[:tipo_nome]
    t = t.where(cor: atributos[:tipo_cor]) if atributos[:tipo_cor]

    t = t.first
    if !t
        puts("Tipo não encontrado")
        return
    end
    lin.tipo_id = t.id
    
    if lin.invalid?
        printErro lin
    else
        lin.save
    end
end

