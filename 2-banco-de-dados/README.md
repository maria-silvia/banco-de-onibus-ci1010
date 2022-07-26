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

Rode bd.rb para ver os comandos disponíveis:

```
ruby bd.rb
```

Cada comando deve ser rodado com `ruby ./bd.rb` na frente.

Exemplos de comandos:

```
ruby bd.rb lista linhas
ruby bd.rb lista linhas --codigo="023"
ruby bd.rb lista tipos --cor="amarelo"
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
