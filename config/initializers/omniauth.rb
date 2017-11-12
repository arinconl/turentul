OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 
  provider :facebook, '1244982392314635', '20652d83ef72f4bac1e6d3a9e8823808'

  provider :google_oauth2, '367706817572-cvc8gjrqggppquqsgd6jbciqecjvrjdh.apps.googleusercontent.com', 'X_IvA92fdAAQPbrNptVr9YCm', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}


end