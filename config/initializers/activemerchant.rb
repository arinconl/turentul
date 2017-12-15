ActiveMerchant::Billing::Base.mode = :test
GATEWAY = ActiveMerchant::Billing::BogusGateway.new