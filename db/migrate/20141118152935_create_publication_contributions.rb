class CreatePublicationContributions < ActiveRecord::Migration
  def change
    create_table :publication_contributions do |t|
      t.integer :journalist_id, null: false
      t.integer :publication_id, null: false

      t.timestamps null: false
    end
  end
end
