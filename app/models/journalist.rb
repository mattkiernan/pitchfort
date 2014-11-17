class Journalist < ActiveRecord::Base
  validates :name, presence: true
end
