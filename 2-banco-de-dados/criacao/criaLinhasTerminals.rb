require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
                                        :database => "Tabelas.sqlite3" 
 
ActiveRecord::Base.connection.create_table :linhas_terminals do |t|  
    t.references :linha, :unique => true 
    t.references :terminal, :unique => true
end 
