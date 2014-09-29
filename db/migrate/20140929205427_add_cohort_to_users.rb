class AddCohortToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :cohort, index: true
  end
end
