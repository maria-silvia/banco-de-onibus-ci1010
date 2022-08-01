require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 

class Terminal < ActiveRecord::Base; 
    belongs_to :endereco
    has_and_belongs_to_many :linhas, -> { distinct }

    validates :nome, :endereco, :presence => true
end

