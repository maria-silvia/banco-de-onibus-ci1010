require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
                                        :database => "Tabelas.sqlite3" 
 
ActiveRecord::Base.connection.create_table :linhas do |t|  
    t.string   :nome 
    t.string   :codigo, limit: 3 
    t.references :tipo, foreign_key:true
end 
