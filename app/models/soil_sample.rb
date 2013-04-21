class SoilSample < ActiveRecord::Base
  # TODO - change all this to use strong params
  attr_accessible :lat, :long, :moisture, :pH, :temperature, :time, :device_id, :comments, :device
  
  # TODO - Need to work this in to validate valus 
  
  # validates :lat, :numericality => true, :allow_blank => true   
  # validates :long, :numericality => true, :allow_blank => true  
  # validates :moisture, :numericality => true, :allow_blank => true  
  # validates :pH, :numericality => true, :allow_blank => true  
  # validates :temperature, :numericality => true, :allow_blank => true  
  # validates :time, :numericality => true, :allow_blank => true  
end
