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
    if t.empty? 
        puts("Tipo não encontrado")
        return
    end
    if t.many?
        puts "Mais de um tipo encontrado com esses atributos"
        return
    end
    t = t.first
    lin.tipo_id = t.id
    
    if lin.invalid?
        printErro lin
    else
        lin.save
        puts("Registro criado com sucesso")
        imprimeLinha lin
    end
end

# -------------------- EXCLUSAO ---------------------
def excluiLinha(atributos)
    lin = buscaLinhas(atributos)
    if !lin
        puts "Registro não encontrado"
        return
    end
    if lin.distinct.count > 1
        puts "Há #{lin.distinct.count} registros com esses atributos"
        return
    end
    lin = lin.first    
    print "Deletando  "
    imprimeLinha lin
    lin.delete
    puts "Linha deletada"
end
