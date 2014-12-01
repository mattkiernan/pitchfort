class Pitch < ActiveRecord::Base
  STATUSES = ["Not sent", "Sent", "Declined", "Accepted"]

  validates_inclusion_of :status, in: STATUSES
  validates :subject, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :announcement_id, presence: true

  has_many :pitch_topics
  has_many :pitches, through: :pitch_topic
  has_many :pitch_targets
  belongs_to :journalist
  belongs_to :announcement

  def publications
    journalist = Journalist.find(journalist_id)
    journalist.publications
  end

  def client_name
    announcement.client.name
  end

  def announcement_name
    announcement.name
  end
end
