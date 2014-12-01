class SetPitchDefaultToSent < ActiveRecord::Migration
  def change
    change_column_default :pitches, :status, "Sent"
  end
end
