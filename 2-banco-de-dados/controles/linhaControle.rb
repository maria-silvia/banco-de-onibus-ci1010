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
    linhas = buscaLinhas atributos
    linhas.each do |l|
        imprimeLinha l
    end
    rescue => e
        puts e.message
end

# -------------------- INCLUSAO ---------------------
def incluiLinha(atributos)
    lin = Linha.new()
    lin.nome = atributos[:nome]
    lin.codigo = atributos[:codigo]
    
    begin
        t = buscaTipo({
            :nome => atributos[:tipo_nome], 
            :cor => atributos[:tipo_cor]
        })
    rescue => e
        puts e.message
        return
    end
    if t.many?
        puts "Erro: Mais de um tipo encontrado com esses atributos"
        return
    end

    lin.tipo_id = t.first.id
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
    linhas = buscaLinhas(atributos)
    if linhas.many?
        puts "Erro: Há #{linhas.distinct.count} registros com esses atributos"
        return
    end
    lin = linhas.first    
    print "Deletando  "
    imprimeLinha lin
    lin.delete
    puts "Linha deletada"
    rescue => e
        puts e.message
end
