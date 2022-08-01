# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'terminal.rb'

def listaLinhasTerminals(att)
    linhas_keys = %w[linha codigo cor tipo]
    terminals_keys = %w[terminal rua numero]
    
    if (att.keys & linhas_keys).any?
        # busca por linhas
        linhas = Linha.includes(:tipo).joins(:terminals).distinct
        linhas = linhas.where(nome: att[:linha]) if att[:linha]
        linhas = linhas.where(codigo: att[:codigo]) if att[:codigo]
        linhas = linhas.where('tipo.nome': att[:tipo]) if att[:tipo]
        linhas = linhas.where('tipo.cor': att[:cor]) if att[:cor]

        linhas = linhas.where('terminals.nome': att[:terminal]) if att[:terminal]
        if linhas.empty?
            puts "Registro nao encontrado"
        end
        linhas.each do |l|
            puts "Linha #{l.nome} passa em Terminal #{l.terminals.first.nome}  "
            # l.terminals.each do |t|
            #     print "  #{t.nome} "
            # end
        end
    elsif (att.keys & terminals_keys).any?
        # busca por terminals
        terms = Terminal.includes(:endereco).joins(:linhas).distinct
        terms = terms.where(nome: att[:terminal]) if att[:terminal]
        terms = terms.where('endereco.rua': att[:rua]) if att[:rua]
        terms = terms.where('endereco.numero': att[:numero]) if att[:numero]

        terms = terms.where('linhas.nome': att[:linha]) if att[:linha]
        if terms.empty?
            puts "Registro nao encontrado"
        end
        terms.each do |t|
            puts "Terminal #{t.nome} tem linhas:"
            t.linhas.each do |l|
                puts "  #{l.nome} "
            end
        end
    else
        listaTudoPorLinha
        puts ""
        listaTudoPorTerminal
    end
end

# -------------------- INCLUSAO ---------------------
def incluiLinhasTerminals(atributos)
    begin
        terminal_att = atributos.dup
        terminal_att[:nome] = atributos[:terminal]
        query = buscaTerminals(terminal_att) 
    rescue NenhumRegistroError => e
    rescue VariosRegistros => e
        puts e.message
        return
    end
    terminal = query.first        

    begin
        linha_att = atributos.dup
        linha_att[:nome] = atributos[:linha]
        query = buscaLinhas(linha_att) 
    rescue NenhumRegistroError => e
    rescue VariosRegistros => e
        puts e.message
        return
    end    
    linha = query.first        

    linha.terminals << terminal
    terminal.linhas << linha
    
    puts("Relacao criada com sucesso")
    puts "#{terminal.nome} <=> #{linha.nome}"
end








# para cada linha, os terminais por quais passa
def listaTudoPorLinha
    Linha.all.each do |l|
        listaTerminalPorLinha l
    end
end
def listaTerminalPorLinha(lin)
    puts "Linha #{lin.nome} passa em "
    lin.terminals.each do |t|
        puts "    #{t.nome} "
    end
end

# para cada terminal, as linhas que passam nele
def listaTudoPorTerminal
    Terminal.all.each do |term|
        listaLinhaPorTerminal term
    end
end    
def listaLinhaPorTerminal(term)
    puts "Em Terminal #{term.nome} passam as linhas"
    term.linhas.each do |l|
        puts "    #{l.nome} "
    end
end
