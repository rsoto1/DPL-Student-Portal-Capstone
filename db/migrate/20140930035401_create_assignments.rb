class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :type
      t.integer :cohort_id
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
