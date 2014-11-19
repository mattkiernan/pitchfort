class Journalist < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :coverage_topics
  has_many :topics, through: :coverage_topics
  has_many :publication_contributions
  has_many :publications, through: :publication_contributions
  has_many :pitch_targets
  has_many :pitches, through: :pitch_targets

  def full_name
    "#{first_name} #{last_name}"
  end
end
