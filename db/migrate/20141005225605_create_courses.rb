class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :duration
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
