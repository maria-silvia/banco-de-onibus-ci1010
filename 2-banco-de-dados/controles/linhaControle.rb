# -*- coding: utf-8 -*-
require './utils.rb'
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeLinha(lin)
    puts "#{lin.id} #{lin.codigo} #{lin.nome} - #{lin.tipo.nome} (#{lin.tipo.cor})"
end

def buscaLinhas(atributos)
    linhas = Linha.includes(:tipo).all
    linhas = linhas.where(nome: atributos[:nome]) if atributos[:nome]
    linhas = linhas.where(codigo: atributos[:codigo]) if atributos[:codigo]
    linhas = linhas.where(id: atributos[:id]) if atributos[:id]

    linhas = linhas.where(tipo: { nome: atributos[:tipo_nome]}) if atributos[:tipo_nome]
    linhas = linhas.where(tipo: { cor: atributos[:tipo_cor]}) if atributos[:tipo_cor]
    return linhas
end

# -------------------- LISTA ---------------------
def listaLinhas(atributos)
    if atributos.empty?()
        listaTodasLinhas
    else
        linhas = buscaLinhas atributos
        linhas.each do |l|
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

