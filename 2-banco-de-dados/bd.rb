require 'thor'
require './controles/linhaControle.rb'

class BancoDeDadosCLI  < Thor

    desc "lista TABELA", "lista <tabela>"
    def lista(tabela)
        case tabela 
            when 'linhas'
                listaTodasLinhas
            when 'tipos'
            when 'terminais'
            when 'enderecos'
        end
    end

end

BancoDeDadosCLI.start(ARGV)
