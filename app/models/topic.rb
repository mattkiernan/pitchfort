class Topic < ActiveRecord::Base
  has_many :coverage_topics
  has_many :journalists, through: :coverage_topics
end
