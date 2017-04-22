class SetDefaultsValuesOnTodo < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:todos, :done, false)
    change_column_default(:todos, :priority, 0)
  end
end
