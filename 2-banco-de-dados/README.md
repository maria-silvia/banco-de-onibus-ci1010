## dependências

- ruby 3.0.0p0
- activerecord
- sqlite3
- thor

## Como executar

Crie e popule o banco de dados:

```
./criaTudo.sh
```

Cada comando deve ser rodado com `ruby ./bd.rb`, seguido da tabela e atributos, cada atributo como opcao do comando:

```
ruby ./bd.rb <operação> <tabela> --atributo1="valor" --atributo2="valor"
```

OPERAÇÕES:

- inclusao
- alteracao
- exclusao
- lista

| TABELAS          | ATRIBUTOS POR TABELA      |
| ---------------- | ------------------------- |
| linhas           | nome codigo tipo_nome cor |
| tipos            | nome cor                  |
| terminals        | nome rua numero           |
| enderecos        | rua numero                |
| linhas_terminals | linha terminal            |

### Exemplos:

```
ruby bd.rb lista linhas --cor="amarelo"
ruby bd.rb lista terminals --rua="Av Parana"

ruby bd.rb inclusao linhas --nome="Paineiras" --codigo="231" --cor="amarelo"

ruby bd.rb exclusao linhas --cor="amarelo"
```

Em `exemplos.sh` há mais exemplos também.

## Entidades

- Linhas de ônibus
- Tipos de ônibus
- Terminais
- Enderecos

## Relações

**1:1** Terminal e Endereço

> Cada Terminal tem um endereço único dele.

**1:N** Linha e Tipo

> Um tipo tem várias linhas.
> Uma linha tem um tipo.

**N:N** Linhas e Terminais

> Uma linha passa em um ou mais terminais.
> Um terminal tem uma ou mais linhas passando nele.
