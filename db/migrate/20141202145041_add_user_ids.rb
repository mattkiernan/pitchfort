class AddUserIds < ActiveRecord::Migration
  def change
    add_column :journalists, :user_id, :integer, null: false
    add_column :announcements, :user_id, :integer, null: false
    add_column :pitches, :user_id, :integer, null: false
  end
end
