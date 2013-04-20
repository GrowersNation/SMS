class TextMessageController < ApplicationController
  
  # {"AccountSid"=>"AC0cbdc322dc58fddb8962e6062c7d8f48", 
  # "Body"=>"Ph 7.0", "ToZip"=>"", "FromState"=>"", "ToCity"=>"", 
  # "SmsSid"=>"SM55a7ffd250549828224e7fac39072745", "ToState"=>"Telford", "To"=>"+441952787011", 
  # "ToCountry"=>"GB", "FromCountry"=>"GB", "SmsMessageSid"=>"SM55a7ffd250549828224e7fac39072745", 
  # "ApiVersion"=>"2010-04-01", "FromCity"=>"", "SmsStatus"=>"received", "From"=>"+447818610137", "FromZip"=>"", 
  # "controller"=>"text_message", "action"=>"parse"}
  
    # t.float    "ph"
    # t.float    "longitude"
    # t.float    "latitude"
    # t.float    "moisture"
    # t.float    "temperature"
  
  def parse
    message = params[:Body]
    process_message(message)
    
  end
  
  def process_message(message)
    message.gsub!(/\s+/, '') #remove white space

    if message.blank? || message =~ /info|start/
      render 'instructions.xml.erb', :content_type => 'text/xml' and return
    end
    
    
    # validate data
    # step data
    
    # attempt to split the message
    readings = message.split(',')

    process_data(readings)
   
  end
  
  def process_data(readings)
    if readings.length == 3
      create_sample(readings)
    else
      
    end
  end
  
  def create_sample(data)
    SoilSample.create(:pH => data[0], :temperature => data[1] , :moisture => data[2])
    
    render 'successful_sample.xml.erb', :content_type => 'text/xml' and return
  end
end
