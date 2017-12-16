#Validates bike instance variables before storage
class Bike < ActiveRecord::Base
    self.primary_key = :bikeid
    has_many :tickets
    has_many :renters, :through => :ticket
    # Sets checks for when data is entered into the database
    # :presence specifies that the field cannot be empty
    # :numericality specifies that the input can only be a number 
    validates :bikeid, :presence => true, :format => {:with => /\w\d\d\d\d/, :message => "the format has to be similar to A0000"}
    validates :serialnumber, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :condition, :presence => true, :format => {:with => /\w*/, :message => "the condition field can only include letters"}
    validates :style, :presence => true
    validates :size, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :color, :presence => true, :format => {:with => /\w*/, :message => "the color field can only include letters"}
    #validates :availability, :presence => true
    validates :location, :presence => true
    validates :fare, :presence => true, :numericality => {:only_integer => false, :message => "must be a number"}
    validates :picture, :presence => true
    
end