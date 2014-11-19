class Announcement < ActiveRecord::Base
  belongs_to :client
  has_many :pitches
end
