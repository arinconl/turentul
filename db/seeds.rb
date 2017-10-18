bikes = [
  {:bikeid => 'A1000',
    :serialnumber => '12345',
    :rating => 'Good',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Mountain',
    :size => 60,
    :color => 'yellow',
    :availability => true,
    :lastcheck => DateTime.strptime("10/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'http://www.bikesdirect.com/products/dawes/images/hay_1000_yellow_2100.jpg'},

    
  {:bikeid => 'A1002',
    :serialnumber => '123235',
    :rating => 'Good',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Touring',
    :size => 57,
    :color => 'Black',
    :availability => true,
    :lastcheck => DateTime.strptime("10/03/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 2.50,
    :accessories => 'Basket',
    :picture => 'https://i.pinimg.com/originals/d7/8e/ee/d78eee7a3e157c26bfab6b1561892c3b.jpg'},


  {:bikeid => 'A1003',
    :serialnumber => '122345',
    :rating => 'Average',
    :condition => 'Poor',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 59,
    :color => 'Blue',
    :availability => true,
    :lastcheck => DateTime.strptime("10/05/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Newcomb',
    :fare => 2.50,
    :accessories => 'Horn',
    :picture => 'https://www.berk-composites.com/wp/wp-content/uploads/2015/12/Berk-Blue-road-bike.jpg'},
    
    
  {:bikeid => 'A1004',
    :serialnumber => '13445',
    :rating => 'Poor',
    :condition => 'Poor',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Mountain',
    :size => 58,
    :color => 'Green',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Boggs',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'http://www.bikesdirect.com/products/motobecane/mountain_bikes/fantom-29-x4-flashgreen-21.jpg'},
]


bikes.each do |rides|
  Bike.create!(rides)
end
