require './utils.rb'
$:.push 'modelos/'
require 'terminal.rb'
require 'endereco.rb'

def imprimeTerminalE(ende)
    puts "#{ende.id} #{ende.nome} (#{ende.endereco.rua}, #{ende.endereco.numero})"
end

# -------------------- LISTA ---------------------
def listaTerminals(atributos)
    begin
        registros = buscaTerminals atributos
    rescue NenhumRegistroError => e
        puts e.message
        return
    rescue VariosRegistros => e
        registros = e.registros
    end

    registros.each do |r|
        imprimeTerminalE r
    end
end

# -------------------- INCLUSAO ---------------------
def incluiTerminalE(att)
    novo = Terminal.new()
    novo.nome = att[:nome]
    novo_e = Endereco.new({:rua => att[:rua], :numero => att[:numero]})
    novo.endereco = novo_e
    if novo.invalid? || novo_e.invalid?
        printErro novo_e
        printErro novo
    else
        novo.save
        puts("Registro criado com sucesso")
        imprimeTerminalE novo
    end
end

# -------------------- EXCLUSAO ---------------------
def excluiTerminal(atributos)
    terminais = buscaTerminals(atributos)
    t = terminais.first    
    print "Destruindo  "
    imprimeTerminalE t
    t.destroy
    puts "Terminal destruido"

    rescue => e
        puts e.message
end