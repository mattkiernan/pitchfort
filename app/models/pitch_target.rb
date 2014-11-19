class PitchTarget < ActiveRecord::Base
  belongs_to :journalist
  belongs_to :pitch
end
