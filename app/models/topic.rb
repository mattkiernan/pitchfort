class Topic < ActiveRecord::Base
  has_many :coverage_topics
end
