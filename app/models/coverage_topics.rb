class CoverageTopics < ActiveRecord::Base
  belongs_to :topics
  belongs_to :journalists
end
