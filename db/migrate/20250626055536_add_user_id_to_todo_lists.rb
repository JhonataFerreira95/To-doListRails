class AddUserIdToTodoLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :todo_lists, :user, foreign_key: true, null: true
  end
end
