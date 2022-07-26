# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'


def imprimeLinha(lin)
    tipo = Tipo.find(lin.tipo_id)
    puts "#{lin.codigo} #{lin.nome} - #{tipo.nome} (#{tipo.cor})"
end

def listaTodasLinhas
    puts "Listando todas as Linhas de Ônibus:"
    lin = Linha.all
    lin.each do |l|
        imprimeLinha l
    end
end

def listaPorTipoCor(cor)
    tipo = Tipo.find_by_cor(cor)
    lin = Linha.where(tipo_id: tipo.id)
    lin.each do |l|
        imprimeLinha l
    end
end

