class CreatePitchTargets < ActiveRecord::Migration
  def change
    create_table :pitch_targets do |t|
      t.integer :journalist_id, null: false
      t.integer :pitch_id, null: false

      t.timestamps null: false
    end

    add_index :pitch_targets, :journalist_id
    add_index :pitch_targets, :pitch_id
  end
end
