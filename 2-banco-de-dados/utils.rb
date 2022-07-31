def printErro(obj)
    obj.errors.messages.each do |tipo|
        print "Erro de validação em #{tipo[0]}: "
        tipo[1].each do |msg|
            puts "#{msg}"
        end
    end
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