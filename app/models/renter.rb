#Validates and stores renter information and credentials
#Model for reading google+ info
class Renter < ActiveRecord::Base
  self.primary_key = :renterID
  has_many :tickets
  has_many :bikes, :through => :tickets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
    # Sets checks for when data is entered into the database
    # :presence specifies that the field cannot be empty
    # :numericality specifies that the input can only be a number 
    validates :renterID, :presence => true, :format => {:with => /\d{21}/, :message => "must contain 21 numbers"}
    validates :renterName, :presence => true, :format => {:with => /\w*/, :message => "can only include letters"}
    validates :email, :presence => true, :format => {:with => /.*@.*\.[coe][ord][mgu]/, :message => "requires input like example@gmail.com or example@tulane.edu"}
    # validates :phone, :presence => false, :format => {:with => /\(\d{3}\)-\d{3}-\d{4}/, :message => "requires a phone number like (123)-456-7890"}
    # validates :cCN, :presence => false, :format => {:with => /\d{16}/, :message => "must contain 16 numbers"}
  
  #Allows us to read in google+ information
  def self.from_omniauth(auth)
    where(provider: auth.provider, renterID: auth.uid).first_or_create do |renter|
      renter.provider = auth.provider
      renter.renterID = auth.uid
      renter.renterName ||= auth.info.name
      renter.oauth_token = auth.credentials.token
      renter.oauth_expires_at = Time.at(auth.credentials.expires_at)
      renter.picture = auth.info.image
      #Adds in dummy values for other required info
      renter.email = auth.info.email
      renter.admin = false
      # renter.phone = "(234)-394-1948"
      # renter.cCN = "1234567890123456"
      renter.save!
    end 
  end
end
