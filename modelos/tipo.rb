require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 


class Tipo < ActiveRecord::Base; 
    has_many :linhas, :dependent => :destroy
end

