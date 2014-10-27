class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :description
      t.belongs_to :cohort, index: true

      t.timestamps
    end
  end
end
