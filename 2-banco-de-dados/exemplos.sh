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

echo "====== LISTA de LINHAS TERMINALS"
ruby bd.rb lista linhas_terminals --linha="Inter 2"
ruby bd.rb lista linhas_terminals --terminal="Cabral"
ruby bd.rb lista linhas_terminals --cor="amarelo"
ruby bd.rb lista linhas_terminals --tipo="Expresso" --cor="amarelo"
ruby bd.rb lista linhas_terminals --codigo="023"
ruby bd.rb lista linhas_terminals --codigo="666"
ruby bd.rb lista linhas_terminals --rua="Av Presidente" --linha="Solitude"

echo "====== INCLUSAO de LINHAS"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --cor="amarelo"
ruby bd.rb inclusao linhas --nome="Centenario" --codigo="739" --tipo="Expresso"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --cor="verde" --tipo="Convencional"
ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --tipo="mini"
ruby bd.rb inclusao linhas --codigo="231"
ruby bd.rb inclusao linhas --codigo="2"
ruby bd.rb inclusao linhas --cor="amarelo"
ruby bd.rb lista linhas

echo "====== INCLUSAO de TERMINAL"
ruby bd.rb inclusao terminals --nome="Hauer" --rua="Marechal Floriano" --numero="0"
ruby bd.rb inclusao terminals
ruby bd.rb inclusao terminals --rua="Marechal Floriano" --numero="0"
ruby bd.rb inclusao terminals --nome="Hauer" --rua="Marechal Floriano"
ruby bd.rb inclusao terminals --nome="Hauer" --numero="0"
ruby bd.rb inclusao terminals --nome="Hauer" --numero="0" --cor="verde"
ruby bd.rb lista terminals

echo "====== INCLUSAO de ENDERECOS"
ruby bd.rb inclusao enderecos
ruby bd.rb inclusao enderecos --rua="jkh" --numero="78"
ruby bd.rb lista enderecos

echo "====== INCLUSAO de LINHAS TERMINALS"
ruby bd.rb inclusao linhas_terminals
ruby bd.rb inclusao linhas_terminals --terminal="Hauer" --linha="Interbairros III"
ruby bd.rb inclusao linhas_terminals --terminal="Cabral" --cor="amarelo"
ruby bd.rb inclusao linhas_terminals --linha="Petropolis"
ruby bd.rb inclusao linhas_terminals --terminal="Cabral"
ruby bd.rb lista linhas_terminals

echo "====== EXCLUSAO de LINHAS"
ruby bd.rb exclusao linhas --nome="Solitude"
ruby bd.rb exclusao linhas --cor="amarelo"
ruby bd.rb exclusao linhas --nome="recolhe"
ruby bd.rb exclusao linhas
ruby bd.rb exclusao linhas --rua="test"
ruby bd.rb lista linhas

echo "====== EXCLUSAO de TIPOS"
ruby bd.rb exclusao tipos --cor="cinza"
ruby bd.rb exclusao tipos --cor="rosa"
ruby bd.rb exclusao tipos
ruby bd.rb exclusao tipos --nome="Expresso"
ruby bd.rb exclusao tipos --rua="ahn"
ruby bd.rb lista tipos

echo "====== EXCLUSAO de TERMINALS"
ruby bd.rb lista terminals
ruby bd.rb lista enderecos
ruby bd.rb exclusao terminals --nome="Sta Candida"
ruby bd.rb exclusao terminals --rua="Av Parana"
ruby bd.rb exclusao terminals --cor="rosa"
ruby bd.rb exclusao terminals
ruby bd.rb lista terminals
ruby bd.rb lista enderecos

set +x
