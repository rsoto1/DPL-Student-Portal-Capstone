class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assignment, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
