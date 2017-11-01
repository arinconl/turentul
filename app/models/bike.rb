class Bike < ActiveRecord::Base
    
    # Sets checks for when data is entered into the database
    # :presence specifies that the field cannot be empty
    # :numericality specifies that the input can only be a number 
    validates :bikeid, :presence => true, :format => {:with => /\w\d\d\d/, :message => "Bike ID format has to be similar to A000"}
    validates :serialnumber, :presence => true, :numericality => true
    validates :condition, :presence => true, :format => {:with => /\w*/, :message => "The condition field can only include letters"}
    validates :style, :presence => true
    validates :size, :presence => true
    validates :color, :presence => true, :format => {:with => /\w*/, :message => "The color field can only include letters"}
    validates :availability, :presence => true
    validates :location, :presence => true
    validates :fare, :presence => true, :numericality => true
    validates :picture, :presence => true
    
end