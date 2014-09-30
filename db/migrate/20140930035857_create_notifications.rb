class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.boolean :read
      t.text :message
      t.string :sender_name
      t.string :sender_email

      t.timestamps
    end
  end
end
