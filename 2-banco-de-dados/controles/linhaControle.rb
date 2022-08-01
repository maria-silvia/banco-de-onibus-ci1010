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
    begin
        linhas = buscaLinhas atributos
    rescue NenhumRegistroError => e
        puts e.message
        return
    rescue VariosRegistros => e
        linhas = e.registros
    end

    linhas.each do |l|
        imprimeLinha l
    end
end

# -------------------- INCLUSAO ---------------------
def incluiLinha(atributos)
    lin = Linha.new()
    lin.nome = atributos[:nome]
    lin.codigo = atributos[:codigo]
    
    begin
        t = buscaTipo({
            :nome => atributos[:tipo_nome], 
            :cor => atributos[:cor]
        })
    rescue => e
        puts e.message
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
    lin = linhas.first    
    print "Deletando  "
    imprimeLinha lin
    lin.delete
    puts "Linha deletada"

    rescue => e
        puts e.message
end
