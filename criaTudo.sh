rm -f Tabelas.sqlite3
echo -n "criaTerminals ..."
ruby criacao/criaTerminals.rb
echo "Ok"
echo -n "criaEnderecos ..."
ruby criacao/criaEnderecos.rb
echo "Ok"
echo -n "criaTipos ..."
ruby criacao/criaTipos.rb
echo "Ok"
echo -n "criaLinhas ..."
ruby criacao/criaLinhas.rb
echo "Ok"
echo -n "criaLinhasTerminals ..."
ruby criacao/criaLinhasTerminals.rb
echo "Ok"

echo -n "populaTerminalsE ..."
ruby criacao/populaTerminalsE.rb
echo "Ok"
echo -n "populaTipos ..."
ruby criacao/populaTipos.rb
echo "Ok"
echo -n "populaLinhas ..."
ruby criacao/populaLinhas.rb
echo "Ok"
echo -n "populaLinhasTerminals ..."
ruby criacao/populaLinhasTerminals.rb
echo "Ok"
