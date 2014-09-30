class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 0
    add_index :users, [:cohort_id, :role]
  end
end
