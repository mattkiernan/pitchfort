class CreatePitchTopics < ActiveRecord::Migration
  def change
    create_table :pitch_topics do |t|
      t.integer :pitch_id, null: false
      t.integer :topic_id, null: false

      t.timestamps
    end
  end
end
