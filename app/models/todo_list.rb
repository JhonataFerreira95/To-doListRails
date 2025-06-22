class TodoList < ApplicationRecord
    has_many:todo_items, dependent: :destroy # adc um has many para puxar os dados da tabela todo_items e um destroy para que a tarefa seja removida independete dos itens dentro dela
    alias_attribute :items, :todo_items # adc um alias para fica mais simples a chamada da classe
end
