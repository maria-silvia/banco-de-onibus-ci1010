# Banco de Dados usando ActiveRecord

TP2 de CI1010  
Maria Sílvia Ribeiro Ruy (msrr18)  
GRR20182587

Este trabalho tem como tema o transporte público de Curitiba.
O banco armazena dados das linhas de ônibus, tipos de ônibus, terminais e endereço dos terminais.

## Entidades

- Linha
- Tipo
- Terminal
- Endereco

## Relações

**1:1** Terminal e Endereco

> Cada Terminal tem um endereço único dele.

**1:N** Linha e Tipo

> Um tipo tem várias linhas.
> Uma linha tem um tipo.

**N:N** Linhas e Terminais

> Uma linha passa em um ou mais terminais.
> Um terminal tem uma ou mais linhas passando nele.

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

- inclui
- altera
- exclui
- lista

| TABELAS          | ATRIBUTOS POR TABELA       |
| ---------------- | -------------------------- |
| linhas           | nome codigo tipo(nome) cor |
| tipos            | nome cor                   |
| terminals        | nome rua numero            |
| enderecos        | rua numero                 |
| linhas_terminals | linha(nome) codigo         |
| linhas_terminals | terminal(nome) rua numero  |

Para o comando de alteracao há também o atributo de `id`, que deve ser passado para indicar o registro.

### Exemplos:

Listar todas as linhas de ônibus amarelos  
`ruby bd.rb lista linhas --cor="amarelo"`

Listar terminais que ficam na rua Av Parana  
`ruby bd.rb lista terminals --rua="Av Parana"`

Inclusão de nova linha  
`ruby bd.rb inclui linhas --nome="Paineiras" --codigo="231" --cor="amarelo"`

Alteracao da linha de id 12, altera o nome dela  
`ruby bd.rb altera linhas --id="13" --nome="V. Rex"`

Exclusão terminal com o nome indicado  
`ruby bd.rb exclui terminals --nome="Sta Candida"`

Em `exemplos.sh` há mais exemplos também.

### Demonstracoes

Ao excluir linha, exclui relacao linha terminal:

```
ruby bd.rb lista linhas_terminals --linha="Solitude"
ruby bd.rb exclui linhas --nome="Solitude"
ruby bd.rb lista linhas
ruby bd.rb lista linhas_terminals --linha="Solitude"
```

Ao excluir tipo, exclui linhas daquele tipo e exclui relacao linha terminal que existirem:

```
ruby bd.rb lista linhas
ruby bd.rb lista linhas_terminals --cor="cinza"
ruby bd.rb exclui tipos --cor="cinza"
ruby bd.rb lista linhas
ruby bd.rb lista linhas_terminals --cor="cinza"
```

Ao excluir terminal, exclui seu endereco e relacoes linha terminal que existirem:

```
ruby bd.rb lista terminals
ruby bd.rb lista enderecos
ruby bd.rb lista linhas_terminals --terminal="Sta Candida"
ruby bd.rb exclui terminals --nome="Sta Candida"
ruby bd.rb lista terminals
ruby bd.rb lista enderecos
ruby bd.rb lista linhas_terminals --terminal="Sta Candida"
```

## dependências

- ruby 3.0.0
- activerecord
- sqlite3
- thor
