class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
