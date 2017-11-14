bikes = [
  {:bikeid => 'A1000',
    :serialnumber => '23365',
    :rating => 'Good',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Mountain',
    :size => 60,
    :color => 'yellow',
    :availability => true,
    :lastcheck => DateTime.strptime("10/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 5.00,
    :accessories => 'None',
    :picture => 'http://www.bikesdirect.com/products/dawes/images/hay_1000_yellow_2100.jpg'},

    
  {:bikeid => 'A1001',
    :serialnumber => '69289',
    :rating => 'Good',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Touring',
    :size => 57,
    :color => 'Black',
    :availability => false,
    :lastcheck => DateTime.strptime("10/03/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 5.00,
    :accessories => 'Basket',
    :picture => 'https://i.pinimg.com/originals/d7/8e/ee/d78eee7a3e157c26bfab6b1561892c3b.jpg'},


  {:bikeid => 'A1002',
    :serialnumber => '93513',
    :rating => 'Average',
    :condition => 'Poor',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 59,
    :color => 'Blue',
    :availability => false,
    :lastcheck => DateTime.strptime("10/05/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Newcomb',
    :fare => 2.50,
    :accessories => 'Horn',
    :picture => 'https://www.berk-composites.com/wp/wp-content/uploads/2015/12/Berk-Blue-road-bike.jpg'},
    
    
  {:bikeid => 'A1003',
    :serialnumber => '73310',
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
    
    
  {:bikeid => 'A1004',
    :serialnumber => '90503',
    :rating => 'Good',
    :condition => 'Poor',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 61,
    :color => 'Red',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Newcomb',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'https://www.preownedcycles.co.uk/images/listings/full_size/2013/12/4071.jpg'},
    
    
  {:bikeid => 'A1005',
    :serialnumber => '71441',
    :rating => 'Good',
    :condition => 'Excellent',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Tour',
    :size => 62,
    :color => 'Orange',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Woldenberg Arts',
    :fare => 5.00,
    :accessories => 'None',
    :picture => 'https://ndsmbikes.nl/wp-content/uploads/2017/08/fietsverhuur-in-amsterdam-noord.jpg'},
    
    
  {:bikeid => 'A1006',
    :serialnumber => '26001',
    :rating => 'Poor',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Tour',
    :size => 56,
    :color => 'Purple',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Jones',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'http://media.liveauctiongroup.net/i/30478/26686663_1.jpg?v=8D45830E5E1AF50'},
    
    
  {:bikeid => 'A1007',
    :serialnumber => '85702',
    :rating => 'Poor',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 55,
    :color => 'White',
    :availability => false,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Newcomb',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'http://7169-presscdn-0-61.pagely.netdna-cdn.com/wp-content/uploads/2012/07/611-pearl-white-1.jpg'},
    
    
  {:bikeid => 'A1008',
    :serialnumber => '97595',
    :rating => 'Average',
    :condition => 'Excellent',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Mountain',
    :size => 53,
    :color => 'Grey',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Riley',
    :fare => 7.50,
    :accessories => 'None',
    :picture => 'https://static.evanscycles.com/production/bikes/bmx-bikes/product-image/969-638/mongoose-fireball-2016-mountain-bike-grey-EV240996-7000-1.jpg'},
    
    
  {:bikeid => 'A1009',
    :serialnumber => '24780',
    :rating => 'Average',
    :condition => 'Excellent',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 63,
    :color => 'Brown',
    :availability => false,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Bruff',
    :fare => 7.50,
    :accessories => 'None',
    :picture => 'https://gzmyu4ma9b-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Rondo-Rutt-CF1_carbon-adjustable-geometry-fat-tire-gravel-road-bike_forest.jpg'},
    
    
  {:bikeid => 'B1003',
    :serialnumber => '20819',
    :rating => 'Average',
    :condition => 'Good',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'tour',
    :size => 64,
    :color => 'pink',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Bruff',
    :fare => 7.50,
    :accessories => 'None',
    :picture => 'http://djcatnap.com/wp-content/uploads/2015/09/mercier_SDC_01.jpg'},
    
    
  {:bikeid => 'B1001',
    :serialnumber => '18436',
    :rating => 'Good',
    :condition => 'Poor',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Tour',
    :size => 54,
    :color => 'Magenta',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Richardson',
    :fare => 5.00,
    :accessories => 'None',
    :picture => 'https://i5.walmartimages.com/asr/0af5dd8d-97c3-4e66-813e-74fe3f4889a6_1.550e98bc04395f675b341783eda05655.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF'},
    
    
  {:bikeid => 'B1002',
    :serialnumber => '71919',
    :rating => 'Poor',
    :condition => 'Excellent',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Mountain',
    :size => 52,
    :color => 'Cyan',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Hebert',
    :fare => 2.50,
    :accessories => 'None',
    :picture => 'http://cdn.mos.bikeradar.imdserve.com/images/bikes-and-gear/bikes/mountain-bikes/full-suspension/1418859556438-1nvifb3w04ogm-1200-80.jpg'},
    
    
  {:bikeid => 'B1000',
    :serialnumber => '31224',
    :rating => 'Good',
    :condition => 'Excellent',
    :maintenance => DateTime.strptime("09/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :style => 'Road',
    :size => 42,
    :color => 'Violet',
    :availability => true,
    :lastcheck => DateTime.strptime("10/06/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 2.50,
    :accessories => 'Itself',
    :picture => 'http://cdn.shopify.com/s/files/1/0099/5882/products/circus-unicycles-20-solo-unicycle-purple-1_grande.jpeg?v=1499156863'}
]


bikes.each do |rides|
  Bike.create!(rides)
end



renters = [
  {
  :renterID => "00001",
  :renterName => "Andre Rinconl",
  :cCN => "1234567891001000",
  :ticket => "TN123",
  :numRents => "1",
  :birthday => DateTime.strptime("02/06/1997 17:00", "%m/%d/%Y %H:%M"),
  :email => "arinconl@tulane.edu",
  :phone => "(504)-636-7989"},

  {
  :renterID => "00002",
  :renterName => "Chris Moroz",
  :cCN => "1234567891001000",
  :ticket => "TN124",
  :numRents => "4",
  :birthday => DateTime.strptime("04/08/1997 17:00", "%m/%d/%Y %H:%M"),
  :email => "cmoroz@tulane.edu",
  :phone => "(504)-636-7910"}

  ]

renters.each do |rents|
  Renter.create!(rents)
end

tickets = [
  {
    :ticket => 'TN123',
    :renterID => 1,
    :renterName => 'Andre Rinconl',
    :email => 'arinconl@tulane.edu',
    :bikeid => 'A1000',
    :cCN => '1234567891001000',
    :serialnumber => '12345',
    :checkout => DateTime.strptime("10/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :checkin => DateTime.strptime("10/01/2017 17:00", "%m/%d/%Y %H:%M"),
    :location => 'Stanley Thomas',
    :fare => 2.50,}
    ]
    
  tickets.each do |reciepes|
  Ticket.create!(reciepes)
end