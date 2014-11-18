class CreateCoverageTopics < ActiveRecord::Migration
  def change
    create_table :coverage_topics do |t|
      t.integer :topic_id, null: false
      t.integer :journalist_id, null: false

      t.timestamps null: false
    end

    add_index :coverage_topics, :topic_id
    add_index :coverage_topics, :journalist_id
  end
end
