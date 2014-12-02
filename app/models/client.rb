class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :announcements

  def announcement_count
    announcements.count
  end

  def pitches
    Pitch.joins(:announcement).where(announcements: {client_id: id})
  end
end
