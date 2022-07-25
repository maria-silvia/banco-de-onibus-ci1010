require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
                                        :database => "Tabelas.sqlite3" 
 
ActiveRecord::Base.connection.create_table :terminals do |t|  
    t.string   :nome 
    t.references :endereco, foreign_key:true
end 
