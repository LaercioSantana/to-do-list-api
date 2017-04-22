class AddTodoReferenceToUsers < ActiveRecord::Migration[5.0]
  def up
    add_reference :todos, :user
  end
  def down
    remove_reference :todos, :user
  end
end
