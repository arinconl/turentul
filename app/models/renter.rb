class Renter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
    # Sets checks for when data is entered into the database
    # :presence specifies that the field cannot be empty
    # :numericality specifies that the input can only be a number 
    validates :renterID, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :name, :presence => true, :format => {:with => /\w*/, :message => "can only include letters"}
    validates :email, :presence => true, :format => {:with => /.*@.*\.[coe][ord][mgu]/, :message => "requires input like example@gmail.com or example@tulane.edu"}
    validates :phone, :presence => true, :format => {:with => /\(\d{3}\)-\d{3}-\d{4}/, :message => "requires a phone number like (123)-456-7890"}
    validates :cCN, :presence => true, :format => {:with => /\d{16}/, :message => "must contain 16 numbers"}
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
