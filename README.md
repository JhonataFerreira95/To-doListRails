# Documentação da aplicação Todo-List com RubyOnRails-7.1.5 e Postgres-17

## Estrutura do projeto

```bash

├── .ruby-lsp/
├── app/
│ ├── assets/
│ ├── channels/
│ ├── controllers/
│ ├── helpers/
│ ├── jobs/
│ ├── mailers/
│ ├── models/
│ ├── views/
├── bin/
├── config/
├── db/
├── lib/
├── log/
├── public/
├── storage/
├── test/
├── tmp/
├── vendor/
├── .dockerignore
├── .gitattributes
├── .gitignore
├── .ruby-version
├── config.ru
├── Dockerfile
├── Gemfile
├── Gemfile.lock 
├── Rakefile
└── README.md

```
## Índice

1. [Criação da estrutura do projeto e as Gems](#criação-da-estrutura-e-gems)
2. [Concatenação e Exibição de Valore](#concatenação-e-exibição-de-valores)
3. [Interpolação de Strings](#interpolação-de-strings)
4. [Operadores Aritméticos](#operadores-aritméticos)
5. [Operadores Lógicos](#operadores-lógicos)
6. [Operadores Especiais](#operadores-especiais)
7. [Manipulação de Strings](#manipulação-de-strings)
8. [Outras Operações com Strings](#outras-operações-com-strings)
9. [Comparação de Números](#comparação-de-números)
10. [Entrada de Dados e Condições](#entrada-de-dados-e-condições)
11. [Estruturas Condicionais - Case](#estruturas-condicionais---case)
12. [Estruturas de Repetição](#estruturas-de-repetição)
13. [Métodos](#métodos)
14. [Operações Matemáticas](#operações-matemáticas)
15. [Blocos (Blocks)](#blocks-blocos)

## Criação da estrutura, Gems e tailwind
Para criação da estrutura do projeto foi usado o comando `rails new <nome projeto> database=<o banco escolhido, foi postgres>`
### Tipo Boolean em Ruby

No Ruby, temos sim o tipo **Boolean**, mas ele não é uma classe separada.  
Em vez disso, usamos as constantes `true` e `false`, que pertencem às classes:

- `TrueClass` → Representa o valor verdadeiro (`true`).
- `FalseClass` → Representa o valor falso (`false`).

O tipo Boolean é uma subclasse da classe `Object`, que é a classe mãe de todas as classes no Ruby.


