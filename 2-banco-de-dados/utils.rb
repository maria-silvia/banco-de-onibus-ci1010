def printErro(obj)
    obj.errors.messages.each do |tipo|
        print "Erro de validação em #{tipo[0]}: "
        tipo[1].each do |msg|
            puts "#{msg}"
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
        raise "Linha não encontrada" 
    end
    return linhas
end

def buscaTipo(atributos) 
    t = Tipo.all
    t = t.where(nome: atributos[:nome]) if atributos[:nome]
    t = t.where(cor: atributos[:cor]) if atributos[:cor]
    if t.empty? 
        raise "Tipo não encontrado" 
    end
    return t
end