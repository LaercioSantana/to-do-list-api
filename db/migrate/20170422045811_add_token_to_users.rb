class AddTokenToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column(:users, :token, :string)
  end

  def down
    remove_column(:users, :token)
  end
end
