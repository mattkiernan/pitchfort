class Publication < ActiveRecord::Base
  validates :name, presence: true

  has_many :publication_contributions
  has_many :journalists, through: :publication_contributions
end
