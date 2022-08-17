require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 

class Endereco < ActiveRecord::Base; 
    has_one :terminal
    validates :rua, :numero, :presence => true
end

