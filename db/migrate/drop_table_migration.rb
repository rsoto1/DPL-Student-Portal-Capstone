class DropTables < ActiveRecord::Migration
  def up
    drop_table :names
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

