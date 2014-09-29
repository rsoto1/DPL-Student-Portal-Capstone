class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :time_zone_name

      t.timestamps
    end
  end
end
