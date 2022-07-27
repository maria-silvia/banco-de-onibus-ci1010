#!/bin/bash

# ./criaTudo.sh
set -x
ruby bd.rb lista linhas
ruby bd.rb lista linhas --nome="Fanny"
ruby bd.rb lista linhas --nome="Inter 2"
ruby bd.rb lista linhas --nome="Inter 2" --codigo="231"
ruby bd.rb lista linhas --nome="Solitude" --codigo="023"
ruby bd.rb lista linhas --id="2"
ruby bd.rb lista linhas --id="700"
ruby bd.rb lista linhas --tipo="4"

# ruby bd.rb lista tipos
# ruby bd.rb lista tipos --cor="vermelho"
# ruby bd.rb lista tipos --cor="dsads"
# ruby bd.rb lista tipos --cor="amarelo"
# ruby bd.rb lista tipos --nome="Convencional"
# ruby bd.rb lista tipos --nome="aaa"

ruby bd.rb lista terminals
ruby bd.rb lista terminals --nome="Boa Vista"
ruby bd.rb lista terminals --nome="centro"
ruby bd.rb lista terminals --endereco="3"
ruby bd.rb lista terminals --endereco="300"

ruby bd.rb lista enderecos

ruby bd.rb lista linhas_terminals
ruby bd.rb lista linhas_terminals --terminal="2"
ruby bd.rb lista linhas_terminals --linha="3"
ruby bd.rb lista linhas_terminals --linha="5" --terminal="2"
ruby bd.rb lista linhas_terminals --linha="1" --terminal="4"

set +x
