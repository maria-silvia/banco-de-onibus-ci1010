$:.push 'modelos/'
require 'terminal.rb'
require 'endereco.rb'

def imprimeEndereco(e)
    puts "#{e.id} #{e.rua}, #{e.numero}"
end

# -------------------- LISTA ---------------------
def listaEnderecos(atributos)
    if atributos.empty?()
        listaTodos
    else
        e = Endereco.where(atributos)
        e.each do |t|
            imprimeEndereco t
        end
    end
end
def listaTodos
    puts "Listando todos os enderecos de Terminais:"
    Endereco.all.each do |t|
        imprimeEndereco t
    end
end
