class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :clients
  has_many :announcements
  has_many :pitches
  has_many :journalists

  def full_name
    "#{first_name} #{last_name}"
  end
end
