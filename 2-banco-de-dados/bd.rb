require 'thor'
require './controles/linhaControle.rb'
require './controles/tipoControle.rb'
require './controles/terminalControle.rb'
require './controles/enderecoControle.rb'
require './controles/linhaTerminalControle.rb'

class BancoDeDadosCLI  < Thor
    class_option :nome
    class_option :codigo
    class_option :id
    class_option :tipo
    class_option :cor
    class_option :endereco
    class_option :rua
    class_option :numero
    class_option :linha
    class_option :terminal

    desc "lista TABELA", "lista <tabela> { --atributo=valor }"
    def lista(tabela) 
        case tabela 
            when 'linhas'
                listaLinhas options
            when 'tipos'
                listaTipos options
            when 'terminals'
                listaTerminals options
            when 'enderecos'
                listaEnderecos options
            when 'linhas_terminals'
                listaLinhasTerminals options
        end
        puts " "
    end

    desc "inclusao TABELA", "inclusao <tabela> { --atributo=valor }"
    def inclusao(tabela)
        case tabela 
            when 'linhas'
                incluiLinha options
            when 'tipos'
                incluiTipo options
            when 'terminals'
                incluiTerminalE options
            when 'enderecos'
                puts "Inserir com Terminal"
            when 'linhas_terminals'
                incluiLinhasTerminals options
        end
        puts " "
    end

    desc "exclusao TABELA", "exclusao <tabela> { --atributo=valor }"
    def exclusao(tabela)
        case tabela 
            when 'linhas'
                excluiLinha options
            when 'tipos'
                excluiTipo options
            when 'terminals'
            when 'enderecos'
            when 'linhas_terminals'
        end
        puts " "
    end

end

BancoDeDadosCLI.start(ARGV)
