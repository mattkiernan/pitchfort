class MovePressReleaseUrlFromPitchesToAnnouncements < ActiveRecord::Migration
  def change
    remove_column :pitches, :press_release_url
    add_column :announcements, :press_release_url, :string
  end
end
