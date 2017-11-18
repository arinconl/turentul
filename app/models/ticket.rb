class Ticket < ActiveRecord::Base
    self.primary_key = :ticket
    belongs_to :renter
    belongs_to :bike
    validates :bikeid, :presence => true, :format => {:with => /\w\d\d\d\d/, :message => "the format has to be similar to A0000"}
    validates :serialnumber, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :location, :presence => true
    validates :fare, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :renterID, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :renterName, :presence => true, :format => {:with => /\w*/, :message => "can only include letters"}
    validates :email, :presence => true, :format => {:with => /.*@.*\.[coe][ord][mgu]/, :message => "requires input like example@gmail.com or example@tulane.edu"}
    validates :cCN, :presence => true, :format => {:with => /\d{16}/, :message => "must contain 16 numbers"}
end
