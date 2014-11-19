class Pitch < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :announcement_id, presence: true

  belongs_to :announcement
  has_many :pitch_targets
  has_many :journalists, through: :pitch_targets
end
