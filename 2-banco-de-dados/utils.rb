def printErro(obj)
    obj.errors.messages.each do |tipo|
        print "Erro de validação em #{tipo[0]}: "
        tipo[1].each do |msg|
            puts "#{msg}"
        end
    end
end