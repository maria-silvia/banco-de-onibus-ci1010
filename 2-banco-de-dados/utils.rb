def printErro(obj)
    obj.errors.messages.each do |tipo|
        print "Erro de validação em #{tipo[0]}: "
        tipo[1].each do |msg|
            print "#{msg} / "
        end
    end
end

def buscaLinhas(atributos)
    linhas = Linha.includes(:tipo).all
    linhas = linhas.where(nome: atributos[:nome]) if atributos[:nome]
    linhas = linhas.where(codigo: atributos[:codigo]) if atributos[:codigo]
    linhas = linhas.where(id: atributos[:id]) if atributos[:id]

    linhas = linhas.where(tipo: { nome: atributos[:tipo_nome]}) if atributos[:tipo_nome]
    linhas = linhas.where(tipo: { cor: atributos[:tipo_cor]}) if atributos[:tipo_cor]
    if linhas.empty? 
        raise NenhumRegistroError.new "linha"
    end
    if linhas.many?
        raise VariosRegistros.new linhas
    end
    return linhas
end

def buscaTipo(atributos) 
    tipos = Tipo.all
    tipos = tipos.where(nome: atributos[:nome]) if atributos[:nome]
    tipos = tipos.where(cor: atributos[:cor]) if atributos[:cor]
    if tipos.empty? 
        raise NenhumRegistroError.new "tipo" 
    end
    if tipos.many?
        raise VariosRegistros.new tipos
    end
    return tipos
end

class NenhumRegistroError < StandardError
    attr_reader :entidade
    def initialize(entidade)
        super
        @entidade = entidade
    end
    def message
        "Nenhum registro #{entidade} encontrado"
    end
end

class VariosRegistros < StandardError
    attr_reader :registros
    def initialize(registros)
        super
        @registros = registros
    end
    def message
        "Há #{registros.distinct.count} registros #{registros.first.class} com os atributos especificados."
    end
end
