class Renter < ActiveRecord::Base
#Allows us to read in facebook information
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      renter.provider = auth.provider
      renter.renterID = auth.uid
      renter.name = auth.info.name
      renter.oauth_token = auth.credentials.token
      renter.oauth_expires_at = Time.at(auth.credentials.expires_at)
      renter.save!
    end
  end
end
