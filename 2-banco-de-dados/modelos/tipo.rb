require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 


class Tipo < ActiveRecord::Base; 
    # attr_accessible :nome, :codigo
end

