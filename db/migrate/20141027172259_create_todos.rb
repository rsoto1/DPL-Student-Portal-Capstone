class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :item
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
