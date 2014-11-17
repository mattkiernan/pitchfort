class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :clients, :user_id
  end
end
