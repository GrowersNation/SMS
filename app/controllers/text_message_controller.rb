class TextMessageController < ApplicationController
  
  def parse
    puts params
    
    render 'default.xml.erb', :content_type => 'text/xml'
  end
  
end
