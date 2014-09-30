class CreateProjectManagers < ActiveRecord::Migration
  def change
    create_table :project_managers do |t|

      t.timestamps
    end
  end
end
