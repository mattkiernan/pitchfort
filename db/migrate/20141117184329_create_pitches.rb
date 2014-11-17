class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :name, null: false
      t.integer :journalist_id, null: false
      t.integer :announcement_id, null: false
      t.string :status, null: false, default: "Not responded"

      t.timestamps null: false
    end
  end
end
