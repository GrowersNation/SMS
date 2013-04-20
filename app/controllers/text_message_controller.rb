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

    message = message + ' '

    if message.blank? || message =~ /\Ainfo\s*\z|start/i
      render 'instructions.xml.erb', :content_type => 'text/xml' and return
    elsif message =~ /\Ainfo\s+([A-z]+)\s+([A-z0-9.=\s]+)/i 
      crop = $1
      options = $2
      process_options(options)
      render 'crop_info.xml.erb', :content_type => 'text/xml' and return
    else
      message.gsub!(/\s+/, '') #remove white space
      process_message(message)
    end
    
  end
  
  def process_options(options)
    
  end
  
  def process_message(message)

    # ph=7.9,temp=31.3,lat=51.112,long=52.1223,moisture=21 
    
    # validate data
    # step data
    
    # attempt to split the message
    readings = split_message(message)
    
    process_data(readings)
   
  end
  
  def split_message(message)
    message.gsub(/\s*=\s*/, '=').split(/\s+|,/).reject!(&:blank?)
  end
  
  def process_data(data)
    @sample = nil
    if data.length == 3
      params = {'pH' => data[0], :temperature => data[1] , :moisture => data[2]}
      sample = SoilSample.create(params)
    else
      params = split_into_hash(data)
      @sample = set_soil_params(params)
    end
    render 'successful_sample.xml.erb', :content_type => 'text/xml' and return
  end
  
  # dirty make tidyier
  def set_soil_params(params)
    sample = SoilSample.new
    params.each do |key, value|
      case key
        when /pH/i
          sample.pH = value
        when /temp/i
          sample.temperature = value
        when /long/i
          sample.long = value
        when /lat/i
          sample.lat = value
        when /moisture|mois/i
          sample.moisture = value 
      end
    end
    sample.save
    return sample
  end
  
  # def match_params_to_model(params)
  #   soil_columns = SoilSample.column_names.join(' ')
  #   sample = SoilSample.new()
  #   params.each do |key, value|
  #     if soil_columns.match(/#{key}/i)
  #       sample[key] = value
  #     end
  #   end
  #   debugger
  #   sample.save
  # end
  
  def split_into_hash(data)
    params = {}
    data.split(',').each do |x|
       x.each do |y|
        key, value = y.split('=')
        params[key] = value
      end    
    end
    return params
  end
end
