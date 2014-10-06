class AddCourseIdToCohort < ActiveRecord::Migration
  def change
    add_reference :cohorts, :course_id, index: true
  end
end
