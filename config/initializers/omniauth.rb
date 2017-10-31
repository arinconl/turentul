OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 
  provider :facebook, '1244982392314635', '20652d83ef72f4bac1e6d3a9e8823808'

end