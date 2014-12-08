class ConvertPhoneToString < ActiveRecord::Migration
  def up
    change_column :journalists, :phone, :string
  end

  def down
    change_column :journalists, :phone, :integer
  end
end
