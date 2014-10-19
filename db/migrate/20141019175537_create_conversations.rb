class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :board, index: true
      t.references :user, index: true
      t.string :title
      t.integer :last_commenter_id
      t.datetime :last_comment_at

      t.timestamps
    end
  end
end
