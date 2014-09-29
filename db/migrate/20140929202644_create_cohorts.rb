class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
