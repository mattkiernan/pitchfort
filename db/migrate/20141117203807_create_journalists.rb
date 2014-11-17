class CreateJournalists < ActiveRecord::Migration
  def change
    create_table :journalists do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email
      t.integer :phone

      t.timestamps null: false
    end
  end
end
