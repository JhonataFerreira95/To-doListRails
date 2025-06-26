# Documentação da aplicação Todo-List com RubyOnRails-7.1.5 e Postgres-17

## Introdução breve...

Como meu projeto em flask <code><img width="40" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/flask.png" alt="Flask" title="Flask"/></code> foi considerado insuficiente, foi solicitado a criação do mesmo, mas com minha stack príncipal que é RubyOnRails <code><img width="40" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/ruby_on_rails.png" alt="Ruby on Rails" title="Ruby on Rails"/></code>, apesar de não domina o framework de ponta a ponta nem ter um conhecimetno 100%, gostaria de me provar nessa aplicação. 


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
## Índices

1. [Criação da estrutura do projeto e as Gems](#criação-da-estrutura-e-gems)
2. [Utilizando o scaffoding](#uso-de-scaffold)
3. [Troca de banco](#troca-de-banco)
4. [Rollback de banco](#rollback-do-banco)
5. [Problemas com o TailwindCSS](#problemas-com-o-tailwindcss)
6. [Problemas com rotas aninhadas](#problemas-com-as-rotas-aninhadas-no-todo_items)
7. [Novo método usado no destroy](#novo-método-adc-ao-destroy)
8. [Criação de login]

## Criação da estrutura, Gems e Tailwind

Para criação da estrutura do projeto foi usado o comando `rails new <nome projeto> --database=<o banco escolhido, foi postgres> --css=<framework css desejado>`

```bash

rails new to-doListRails --database=postgres --css=tailwind

```

## Uso de Scaffolding

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
  adapter: postgresql # Aptar para o seu banco (MySQL, SQLITE, POSTGRES, MARIADB...)
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: seu usuario
  password: sua senha
  host: seu host
  port: porta

```
### Seu usuário do postgresSQL

Caso você não saiba seu usuário do postgres utilize o comando abaixo no pgadmin

```bash

SELECT current_user;

```

## RollBack do banco

Aqui é algo breve, porém importante. Caso seja desejado alterar as tabela na mão via arquivo do `schema.rb`, usei o `rails rollback` para voltar a versão anterior, adc o que deseja após use o `db:migrate` 

### Rollback

```bash

rails rollback

```

## Problemas com o TailwindCSS

Algumas complicações na instalação padrão do TailwindCSS, ficou corrompido. Presume que tinha sido a versão do `rails` e a `gem tailwind` estava atualizada para versão mais nova, porém para minha supresa não foi, executei novamente o comando `CLI` para reinstalar o tailwind e felizmente sucesso. Carregou todos os styles dentro dos arquivos `html.erb`

```bash 

bin/rails tailwindcss:install

```

## Problemas com as rotas aninhadas no Todo_items

Bem, eu queria colocar para fica de uma forma ordenada, onde para ver o item você deve passar pelas lista primeiro, já que é a lógica `Todo_list -> Todo_items`, meu erro foi ter esquecido que `Todo_list` é o pai de `Todo_items`, já que agora eu coloquei o `Todo_items` dentro de `Todo_list`, e passei na rota.

### Rota
```bash

Rails.application.routes.draw do # Para seguir o padrão e aninha por ordem o todo_list a após o todo_items
  resources :todo_lists do # Pai 
    resources :todo_items # Filho
  end

  get "up" => "rails/health#show", as: :rails_health_check # Nosso end point HTTP

end

```

### Passando os parâmentros em html.erb

Um exemplo de heranção para a funcionalidade dos items que dependem totalmente da lista.

```html.erb

<%= form_with(model: [@todo_list, todo_item], class: "contents") do |form| %>

```

## Novo método adc ao destroy

Havia um eve problema quando acontecia a exclusão de um item, já que o usuário ficava na página antiga de itens e não volta para a sua lista de origem, então foi adicionado ao destroy. 

### Chamando o método no controller 

```bash

def destroy
  @todo_item.destroy # remove o item do banco de dados
  respond_to do |format| # Depois, o usuário é redirecionado para a página da lista
    format.html { redirect_to todo_list_path(@todo_list), notice: "Item excluído com sucesso." } # Uma mensagem de sucesso é exibida
    format.json { head :no_content }
  end
end

```
Deixa claro que antes de executar o destroy, Rails executa os métodos `set_todo_list` para carregar a lista correta com base no `todo_list_id` da URL e `set_todo_item` para carregar o item correto dentro da lista

## Para criação de login

Foi utilizada a `gem devise` para a criação de login de forma simples, no `Gemfile` foi adicionada a nova gem, após isso usei o `bundle install` para instalação e para gera os arquivo do banco foi usado o `rails generate devise:install`. Criando o model do usuario e importanto com o `rails db:migrate`.

### Gem

```bash 

gem 'devise'

```

### instalando...

```bash

bundle install

```

### Gerando arquivos

```bash

rails generate devise:install

```

### Criando o model do usuario

```bash

rails generate devise User

```

### migrrando o model para o banco

```bash

db:migrate

```