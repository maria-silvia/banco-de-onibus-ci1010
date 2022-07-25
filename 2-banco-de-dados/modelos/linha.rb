require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 

class LinhaValidator < ActiveModel::Validator
    def validate(record)
        if (record.codigo.size != 3)
            record.errors.add(:codigo, "Codigo deve ter tamanho tres")
        end
        # algo para ser de tipo existente?
    end
end

class Linha < ActiveRecord::Base; 

    belongs_to :tipo

    validates_with LinhaValidator

end

