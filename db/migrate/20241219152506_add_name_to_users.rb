class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string unless column_exists?(:users, :name)
  end
end
