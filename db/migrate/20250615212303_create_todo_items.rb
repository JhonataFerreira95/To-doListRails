class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.belongs_to :todo_list, null: false, foreign_key: true
      t.string :text
      t.boolean :completed, default: false # adc um valor padrão false, já que por padrão ele vem nulo

      t.timestamps
    end
  end
end
