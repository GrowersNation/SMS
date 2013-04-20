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
    message.gsub!(/\s+/, '') #remove white space

    if message.blank? || message =~ /\Ainfo\s*\z|start/i
      render 'instructions.xml.erb', :content_type => 'text/xml' and return
    else 
      process_message(message)
    end
    
  end
  
  def process_message(message)

    # ph=7.9,temp=31.3,lat=51.112,long=52.1223,moisture=21 
    
    # validate data
    # step data
    
    # attempt to split the message
    readings = message.split(',')

    process_data(readings)
   
  end
  
  def process_data(data)
    if data.length == 3
      params = {'pH' => data[0], :temperature => data[1] , :moisture => data[2]}
      create_sample(params)
    else
      
    end
  end
  
  def create_sample(params)
    @sample = SoilSample.create(params)
    render 'successful_sample.xml.erb', :content_type => 'text/xml' and return
  end
end
