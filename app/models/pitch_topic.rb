class PitchTopic < ActiveRecord::Base
  belongs_to :pitch
  belongs_to :topic
end
