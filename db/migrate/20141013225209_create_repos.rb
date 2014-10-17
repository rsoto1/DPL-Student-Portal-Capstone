class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.belongs_to :cohort, index: true
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
