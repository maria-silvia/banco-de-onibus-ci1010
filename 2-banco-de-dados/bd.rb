require 'thor'
require './controles/linhaControle.rb'

class BancoDeDadosCLI  < Thor

    desc "lista TABELA", "lista <tabela> { --atributo=valor }"
    option :nome
    option :codigo
    def lista(tabela)
        case tabela 
            when 'linhas'
                listaLinhas options[:nome], options[:codigo]
            when 'tipos'
            when 'terminais'
            when 'enderecos'
        end
    end

end

BancoDeDadosCLI.start(ARGV)
