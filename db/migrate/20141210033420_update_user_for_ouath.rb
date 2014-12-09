class UpdateUserForOuath < ActiveRecord::Migration
  def up
    change_column :users, :password_digest, :string, null: true
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end

  def down
    change_column :users, :password_digest, :string, null: false
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
