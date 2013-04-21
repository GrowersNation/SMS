class TextMessageController < ApplicationController
  
  # further development, ability to localise into other languages
  # interact with the real API for growers nation
  
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
  
  # make into service
  
  def parse
    @original_message = message = params[:Body] + ' '
    
    if message.blank? || message =~ /\Ainfo\s*\z|start/i
      render 'instructions.xml.erb', :content_type => 'text/xml' and return
    elsif message =~ /\Ainfo\s+([A-z]+)\s+([A-z0-9.=\s]+)/i 
      crop = $1
      options = $2
      request_information(crop, options)
    else
      # check if sending data
      process_sample_data(message)
    end
  end
  
  def request_information(crop, options)
    @crop = crop
    @options_hash = MessageParser.string_to_hash(options)
    if  @options_hash.length == 2 && @options_hash.include?('long') && @options_hash.include?('long')
      # hit external service for data then send back
      render 'crop_info.xml.erb', :content_type => 'text/xml' and return
    else
      render 'incorrect_format.xml.erb', :content_type => 'text/xml' and return
    end
  end
  
  def process_sample_data(readings)
    # ph=7.9,temp=31.3,lat=51.112,long=52.1223,moisture=21 
    readings_hash = MessageParser.string_to_hash(readings)
    # send to external service for now save to out DB
    @sample = set_soil_params(readings_hash)
    
    if @sample
      render 'successful_sample.xml.erb', :content_type => 'text/xml' and return
    else
      render 'unknown_command.xml.erb', :content_type => 'text/xml' and return
    end
  end
  
  # dirty make tidyier
  # move into model
  def set_soil_params(params)
    sample = SoilSample.new
    params.each do |key, value|
      case key
        when /pH/i
          sample.pH = value
        when /temp|temperature/i
          sample.temperature = value
        when /long|longitude/i
          sample.long = value
        when /lat|latitude/i
          sample.lat = value
        when /moisture|mois/i
          sample.moisture = value 
      end
    end
    
    if sample.changed?
      sample.device_id = '01234567822'
      sample.device = 'phone'
      if sample.save
        return sample
      else
        return false
      end
    end
  end

end
