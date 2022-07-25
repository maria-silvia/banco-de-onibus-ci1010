## dependências

- ruby 3.0.0p0
- activerecord
- sqlite3

## Como executar

Criar e popular o banco de dados:
´´´
./criaTudo.sh
´´´

## Entidades

- Linhas de ônibus
- Tipos de ônibus
- Terminais
- Enderecos

## Relações

#### um para um

Terminal e Endereço.
Cada Terminal tem um endereço único dele.

#### um para muitos

Linha e Tipo.
Um tipo tem várias linhas.
Uma linha tem um tipo.

#### muitos para muitos

Linhas e Terminais.
Uma linha passa em um ou mais terminais.
Um terminal tem uma ou mais linhas passando nele.

# to do

lista linhas
lista linhas id=1
lista linha nome="Solitude"
lista linha codigo="023"

lista tipos
lista tipo ...

lista terminais
....

lista enderecos...

> para excluir deve-se usar a id
> exclusao <tabela> id=