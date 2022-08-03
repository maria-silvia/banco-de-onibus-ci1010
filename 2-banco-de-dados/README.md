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

- inclui
- alteracao
- exclui
- lista

ATRIBUTOS:

| TABELAS          | ATRIBUTOS POR TABELA       |
| ---------------- | -------------------------- |
| linhas           | nome codigo tipo(nome) cor |
| tipos            | nome cor                   |
| terminals        | nome rua numero            |
| enderecos        | rua numero                 |
| linhas_terminals | linha(nome) codigo         |
| linhas_terminals | terminal(nome) rua numero  |

Para todas as tabels há o atributo "id" também. No comando de alteracao deve ser passado para selecionar o registro.

### Exemplos:

Ao excluir linha, exclui relacao linha terminal:

```
ruby bd.rb lista linhas_terminals --linha="Solitude"
ruby bd.rb exclui linhas --nome="Solitude"
ruby bd.rb lista linhas_terminals --linha="Solitude"
ruby bd.rb lista linhas
```

Ao excluir tipo, exclui linha e exclui relacao linha terminal:

```
ruby bd.rb lista linhas
ruby bd.rb lista linhas_terminals --cor="cinza"
ruby bd.rb exclui tipos --cor="cinza"
ruby bd.rb lista linhas
ruby bd.rb lista linhas_terminals --cor="cinza"
```

Ao excluir terminal, exclui seu endereco e relacao linha terminal:

```
ruby bd.rb lista terminals
ruby bd.rb lista enderecos
ruby bd.rb lista linhas_terminals --terminal="Sta Candida"
ruby bd.rb exclui terminals --nome="Sta Candida"
ruby bd.rb lista terminals
ruby bd.rb lista enderecos
ruby bd.rb lista linhas_terminals --terminal="Sta Candida"
```

outros:

```
ruby bd.rb lista linhas --cor="amarelo"
ruby bd.rb lista terminals --rua="Av Parana"
ruby bd.rb inclui linhas --nome="Paineiras" --codigo="231" --cor="amarelo"
ruby bd.rb altera linhas --id="13" --nome="V. Rex"

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
