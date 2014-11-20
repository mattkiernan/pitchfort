class Pitch < ActiveRecord::Base
  STATUSES = ["Not sent", "Sent", "Declined", "Accepted"]

  validates_inclusion_of :status, in: STATUSES
  validates :subject, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :announcement_id, presence: true

  belongs_to :announcement
  has_many :pitch_targets
  belongs_to :journalist

  def publications
    journalist = Journalist.find(journalist_id)
    journalist.publications
  end
end
