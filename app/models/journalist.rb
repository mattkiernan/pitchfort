class Journalist < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :coverage_topics
  has_many :topics, through: :coverage_topics

  def full_name
    "#{first_name} #{last_name}"
  end
end
