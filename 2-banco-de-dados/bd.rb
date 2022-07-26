require 'thor'
require './controles/linhaControle.rb'
require './controles/tipoControle.rb'

class BancoDeDadosCLI  < Thor

    desc "lista TABELA", "lista <tabela> { --atributo=valor }"
    option :nome
    option :codigo
    option :id
    option :cor
    def lista(tabela)
        
        case tabela 
            when 'linhas'
                listaLinhas options
            when 'tipos'
                listaTipos options
            when 'terminais'
            when 'enderecos'
            when 'linhas_terminals'
        end
    end

end

BancoDeDadosCLI.start(ARGV)
