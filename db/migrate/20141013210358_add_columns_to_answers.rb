class AddColumnsToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :pull_request, index: true
  end
end
