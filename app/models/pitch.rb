class Pitch < ActiveRecord::Base
  validates :name, presence: true
  validates :journalist_id, presence: true
  validates :announcement_id, presence: true
  validates :status, presence: true
end
