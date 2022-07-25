require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3" 

class Linha < ActiveRecord::Base; 
    belongs_to :tipo
    has_and_belongs_to_many :terminals, -> { distinct }
    validates :nome, :codigo, :tipo, :presence => true
    validates :codigo, length: {is:3}
end