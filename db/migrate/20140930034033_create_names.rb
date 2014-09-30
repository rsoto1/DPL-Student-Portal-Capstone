class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.text :description

      t.timestamps
    end
  end
end
