class TextMessageController < ApplicationController
  
  # {"AccountSid"=>"AC0cbdc322dc58fddb8962e6062c7d8f48", 
  # "Body"=>"Ph 7.0", "ToZip"=>"", "FromState"=>"", "ToCity"=>"", 
  # "SmsSid"=>"SM55a7ffd250549828224e7fac39072745", "ToState"=>"Telford", "To"=>"+441952787011", 
  # "ToCountry"=>"GB", "FromCountry"=>"GB", "SmsMessageSid"=>"SM55a7ffd250549828224e7fac39072745", 
  # "ApiVersion"=>"2010-04-01", "FromCity"=>"", "SmsStatus"=>"received", "From"=>"+447818610137", "FromZip"=>"", 
  # "controller"=>"text_message", "action"=>"parse"}
  
  def parse
    message = params[:body]
    process_message(message)
    
  end
  
  def process_message(message)
    message.gsub!(/\s+/, '') #remove white space
    
    if message.blank?
      render 'instructions.xml.erb', :content_type => 'text/xml' and return
    end
    
    # attempt to split the message
    split = message.split(',')
  end
  
end
