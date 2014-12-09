class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :authentications
  has_many :clients
  has_many :announcements
  has_many :pitches
  has_many :journalists

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.first_name    = auth.info.first_name
      user.last_name    = auth.info.last_name
      user.email    = auth.info.email
      user.save
    end
  end
end
