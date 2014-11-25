class Topic < ActiveRecord::Base
  has_many :coverage_topics, dependent: :destroy
  has_many :journalists, through: :coverage_topics
  has_many :pitch_topics
  has_many :pitches, through: :pitch_topics
end
