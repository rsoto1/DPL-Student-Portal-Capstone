class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :text
      t.string :posted_by

      t.timestamps
    end
  end
end
