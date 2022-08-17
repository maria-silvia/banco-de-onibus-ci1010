# -*- coding: utf-8 -*-

$:.push 'modelos/'
require 'linha.rb'
require 'terminal.rb'

def listaLinhasTerminals(att)
    linhas_keys = %w[linha codigo cor tipo]
    terminals_keys = %w[terminal rua numero]
    
    if (att.keys & linhas_keys).any?
        # busca a partir de linhas
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
            t = l.terminals.first
            puts "Linha #{l.nome} (#{l.id}) passa em Terminal #{t.nome} (#{t.id})  "
        end

    elsif (att.keys & terminals_keys).any?
        # busca a partir de terminals
        terms = Terminal.includes(:endereco).joins(:linhas).distinct
        terms = terms.where(nome: att[:terminal]) if att[:terminal]
        terms = terms.where('endereco.rua': att[:rua]) if att[:rua]
        terms = terms.where('endereco.numero': att[:numero]) if att[:numero]

        terms = terms.where('linhas.nome': att[:linha]) if att[:linha]
        if terms.empty?
            puts "Registro nao encontrado"
        end
        terms.each do |t|
            puts "Terminal #{t.nome} (#{t.id}) tem linhas:"
            t.linhas.each do |l|
                puts "  #{l.nome} (#{l.id})"
            end
        end
    else
        listaTudoPorTerminal
    end
end

# -------------------- INCLUSAO ---------------------
def incluiLinhasTerminals(atributos)
    begin
        terminal_att = atributos.dup
        terminal_att[:nome] = atributos[:terminal]
        query = buscaTerminals(terminal_att) 
    rescue => e
        puts e.message
        return
    end
    terminal = query.first        

    begin
        linha_att = atributos.dup
        linha_att[:nome] = atributos[:linha]
        query = buscaLinhas(linha_att) 
    rescue => e
        puts e.message
        return
    end    
    linha = query.first        

    linha.terminals << terminal
    terminal.linhas << linha
    
    puts("Relacao criada com sucesso")
    puts "Terminal #{terminal.nome} <=> Linha #{linha.nome}"
end


# -------------------- EXCLUSAO ---------------------
def excluiLinhasTerminals(atributos)
    linha_id = atributos[:linha]
    terminal_id = atributos[:terminal]
    linha = Linha.find(linha_id)
    terminal = linha.terminals.find(terminal_id)
    print "Deletando  "
    puts "Terminal #{terminal.nome} <=> Linha #{linha.nome}"
    linha.terminals.delete(terminal)
    puts "Relacao deletada"
    rescue => e
        puts e.message
end










def listaTerminalPorLinha(lin)
    puts "Linha #{lin.nome} (#{lin.id}) passa em "
    lin.terminals.each do |t|
        puts "    #{t.nome}  (#{term.id})"
    end
    puts " nenhum terminal" if lin.terminals.empty?
end
def listaLinhaPorTerminal(term)
    puts "No Terminal #{term.nome} (#{term.id}) passam as linhas"
    term.linhas.each do |l|
        puts "    #{l.nome} (#{l.id})"
    end
    puts " nenhuma linha" if term.linhas.empty?
end

# para cada terminal, as linhas que passam nele
def listaTudoPorTerminal
    Terminal.all.each do |term|
        listaLinhaPorTerminal term
    end
end    
# para cada linha, os terminais por quais passa
def listaTudoPorLinha
    Linha.all.each do |l|
        listaTerminalPorLinha l
    end
end