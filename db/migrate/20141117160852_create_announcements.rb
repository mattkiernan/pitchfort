class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :name, null: false
      t.string :description
      t.date :announcement_date
      t.time :announcement_time
      t.integer :client_id, null: false

      t.timestamps null: false
    end

    add_index :announcements, :client_id
  end
end
