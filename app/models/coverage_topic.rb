class CoverageTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :journalist
end
