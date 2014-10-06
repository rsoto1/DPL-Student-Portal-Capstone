class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.string :duration_unit
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
