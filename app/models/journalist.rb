class Journalist < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :coverage_topics, dependent: :destroy
  has_many :topics, through: :coverage_topics
  has_many :publication_contributions
  has_many :publications, through: :publication_contributions
  has_many :pitches, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_pitches
    pitches.count
  end

  def acceptance_rate
    accepted = Pitch.where(status: "Accepted").count
    if total_pitches == 0 || accepted == 0
      "0%"
    else
      ((accepted.to_f / total_pitches.to_f) * 100).round.to_s + "%"
    end
  end
end
