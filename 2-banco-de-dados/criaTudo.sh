rm -f Tabelas.sqlite3
echo -n "criaTipos ..."
ruby criacao/criaTipos.rb
echo "Ok"
echo -n "criaLinhas ..."
ruby criacao/criaLinhas.rb
echo "Ok"
# echo -n "criaTerminais ..."
# ruby criacao/criaTerminais.rb
# echo "Ok"
# echo -n "criaEnderecos ..."
# ruby criacao/criaEnderecos.rb
# echo "Ok"
# echo -n "criaLinhaTerminal ..."
# ruby criacao/criaLinhaTerminal.rb
# echo "Ok"

echo -n "populaTipos ..."
ruby criacao/populaTipos.rb
echo "Ok"
echo -n "populaLinhas ..."
ruby criacao/populaLinhas.rb
echo "Ok"
# echo -n "populaTerminais ..."
# ruby criacao/populaTerminais.rb
# echo "Ok"echo -n "populaEnderecos ..."
# ruby criacao/populaEnderecos.rb
# echo "Ok"echo -n "populaLinhaTerminal ..."
# ruby criacao/populaLinhaTerminal.rb
# echo "Ok"
