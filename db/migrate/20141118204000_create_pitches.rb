class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.string :press_release_url
      t.string :status, null: false, default: "Not sent"
      t.integer :announcement_id, null: false
      t.datetime :datetime
      t.integer :journalist_id, null: false

      t.timestamps null: false
    end

    add_index :pitches, :announcement_id
    add_index :pitches, :journalist_id
  end
end
