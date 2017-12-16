#Helps the payment process
module PaymentsHelper
  
  #Generates dictionary of months
  def months
    (1..12).collect{|n| ["#{n} - #{Date::MONTHNAMES[n]}", n]}
  end

  #Generates list of years from now to 15 years in the future
  def years
    (Time.now.year..Time.now.year+15)
  end
end
