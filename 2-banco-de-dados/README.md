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

Cada comando deve ser rodado com `ruby ./bd.rb` na frente. Seguido da tabela e atributos, cada atributo como opcao do comando:

```
<operação> <tabela> --atributo1="valor" --atributo2="valor"
```

OPERAÇÕES:

- inclusao
- alteracao
- exclusao
- lista

| TABELAS          | ATRIBUTOS POR TABELA |
| ---------------- | -------------------- |
| linhas           | nome codigo tipo     |
| tipos            | nome cor             |
| terminals        | nome endereco        |
| enderecos        | rua numero           |
| linhas_terminals | linha terminal       |

### Exemplos de comandos:

```
ruby bd.rb lista linhas
ruby bd.rb lista tipos --cor="amarelo"
ruby bd.rb lista terminals --nome="Boa Vista"
ruby bd.rb lista linhas_terminals --terminal="2"
ruby bd.rb lista linhas_terminals --linha="3"

```

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
