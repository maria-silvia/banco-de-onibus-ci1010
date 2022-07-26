require 'thor'
require './controles/linhaControle.rb'

class BancoDeDadosCLI  < Thor

    desc "lista TABELA", "lista <tabela> { --atributo=valor }"
    option :nome
    option :codigo
    option :id
    def lista(tabela)
        
        case tabela 
            when 'linhas'
                listaLinhas options
                
            when 'tipos'
            when 'terminais'
            when 'enderecos'
        end
    end

end

BancoDeDadosCLI.start(ARGV)
