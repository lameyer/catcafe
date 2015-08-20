class User < ActiveRecord::Base
  has_many :cafes, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.name = auth.info.name
    user.image = auth.info.image
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    user
  end

end
