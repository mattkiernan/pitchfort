class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :announcements
  has_many :pitches, through: :announcements

  def announcement_count
    announcements.count
  end
end
