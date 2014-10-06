class RenameColumnOnCohorts < ActiveRecord::Migration
  def change
    rename_column :cohorts, :course_id_id, :course_id
  end
end
