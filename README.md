# Documentação da aplicação Todo-List com RubyOnRails-7.1.5 e Postgres-17

## Introdução breve...

Como meu projeto em flask <code><img width="40" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/flask.png" alt="Flask" title="Flask"/></code> foi considerado insuficiente, foi solicitado a criação do mesmo, mas com minha stack príncipal que é RubyOnRails <code><img width="40" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/ruby_on_rails.png" alt="Ruby on Rails" title="Ruby on Rails"/></code>, apesar de não domina o framework de ponta a ponta nem ter um conhecimetno 100% gostaria de me provar nessa aplicação. 


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
2. [Utilizando o scaffoding](#uso-de-scaffold)
3. [Troca de banco](#troca-de-banco)
4. [Rollback de banco](#rollback-do-banco)

## Criação da estrutura, Gems e Tailwind

Para criação da estrutura do projeto foi usado o comando `rails new <nome projeto> --database=<o banco escolhido, foi postgres> --css=<framework css desejado>`

```bash

rails new to-doListRails --database=postgres --css=tailwind

```

## Uso de Scaffold

O `scaffold` é um comando CLI do Rails para criar arquitetura MVC de uma forma simples e prática, aplicando diretamente, com base nos atributos infromados. No meu caso foi a criação de duas tabelas e uma enum com valor boolean para `true` e `false`. Por padrão o Scaffold usa o SQLITE e como foi pedido alterei para o postgres na próxima seção falo melhor osbre a mudança.

```bash

rails g scaffold todo-item todo-list:belongto text completed:boolean

```

## Troca de banco

Por padrão o `scaffold` faz a criação das tabela do banco para o `SQLITE`, sendo assim de forma local. Utilizei no Gemfile a `gem pg` para usar o postgres. Após o uso do Gem no Gemfile usei o `bundle install` para atulizar e installar nova dependências do projeto. Mudei o banco de forma simples, como o scaffold já criou minhas tabelas locais basta apenas miagra com um `db:migrate`, isso após preencher os parâmetros no `database.yml` para a conexão do seu usuario com o postgres, utilizei o default, já que não irei utlizar de gitflow.

### Gem do postgres

```bash

gem 'pg', '~> 1.5', '>= 1.5.6'

```

### Bundle

```bash

bundle install

```

### Migrar as tabelas

```bash

db:migrate

```

### Conexão com o banco

```bash

default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: seu usuario
  password: sua senha
  host: seu host
  port: porta

```

## RollBack do banco

Aqui é algo breve, porém importante. Caso seja desejado alterar as tabela na mão via arquivo do `schema.rb`, usei o `rails rollback` para voltar a versão anterior, adc o que deseja após use o `db:migrate` 

### Rollback

```bash

rails rollback

```