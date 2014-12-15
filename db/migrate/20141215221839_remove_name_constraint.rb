class RemoveNameConstraint < ActiveRecord::Migration
  def up
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name, :string, null: true
  end

  def down
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
  end
end
