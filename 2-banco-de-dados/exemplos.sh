#!/bin/bash

./criaTudo.sh
set -x
echo "====== LISTA de LINHAS"
ruby bd.rb lista linhas
ruby bd.rb lista linhas --nome="Fanny"
ruby bd.rb lista linhas --nome="Inter 2"
ruby bd.rb lista linhas --nome="Inter 2" --codigo="231"
ruby bd.rb lista linhas --nome="Solitude" --codigo="023"
ruby bd.rb lista linhas --id="2"
ruby bd.rb lista linhas --id="700"
ruby bd.rb lista linhas --rua="testando"
ruby bd.rb lista linhas --cor="amarelo"
ruby bd.rb lista linhas --cor="branco"
ruby bd.rb lista linhas --tipo="Interbairros"
ruby bd.rb lista linhas --tipo="Interbairros" --nome="Fanny"

echo "====== LISTA de TIPOS"
ruby bd.rb lista tipos
ruby bd.rb lista tipos --cor="vermelho"
ruby bd.rb lista tipos --cor="dsads"
ruby bd.rb lista tipos --nome="Convencional"
ruby bd.rb lista tipos --nome="Convencional" --cor="vermelho"
ruby bd.rb lista tipos --rua="teste"

echo "====== LISTA de TERMINALS"
ruby bd.rb lista terminals
ruby bd.rb lista terminals --nome="Boa Vista"
ruby bd.rb lista terminals --nome="centro"
ruby bd.rb lista terminals --rua="Av Parana"
ruby bd.rb lista terminals --numero="500"
ruby bd.rb lista terminals --cor="vermelho"

ruby bd.rb lista enderecos

ruby bd.rb lista linhas_terminals
ruby bd.rb lista linhas_terminals --terminal="2"
ruby bd.rb lista linhas_terminals --linha="3"
ruby bd.rb lista linhas_terminals --linha="5" --terminal="2"
ruby bd.rb lista linhas_terminals --linha="1" --terminal="4"

echo "====== INCLUSAO de LINHAS"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --tipo_cor="amarelo"
ruby bd.rb inclusao linhas --nome="Centenario" --codigo="739" --tipo_nome="Expresso"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --tipo_cor="verde" --tipo_nome="Convencional"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --tipo_nome="mini"
ruby bd.rb inclusao linhas --codigo="231"
ruby bd.rb inclusao linhas --codigo="2"
ruby bd.rb inclusao linhas --cor="amarelo"
ruby bd.rb lista linhas

echo "====== EXCLUSAO de LINHAS"
ruby bd.rb exclusao linhas --nome="Solitude"
ruby bd.rb exclusao linhas --cor="amarelo"
ruby bd.rb exclusao linhas --nome="recolhe"
ruby bd.rb exclusao linhas
ruby bd.rb exclusao linhas --rua="test"
ruby bd.rb lista linhas

# echo "====== EXCLUSAO de TIPOS"
ruby bd.rb exclusao tipos --cor="cinza"
ruby bd.rb exclusao tipos --cor="rosa"
ruby bd.rb exclusao tipos
ruby bd.rb exclusao tipos --nome="Expresso"
ruby bd.rb exclusao tipos --rua="ahn"
ruby bd.rb lista tipos

# BUGA NAO SEI PQ
# ruby bd.rb exclusao linhas --codigo="244154"
set +x
