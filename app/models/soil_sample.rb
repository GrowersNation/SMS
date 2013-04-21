class SoilSample < ActiveRecord::Base
  attr_accessible :lat, :long, :moisture, :pH, :temperature, :time, :device_id, :comments, :device
  
  # refractor
  validates :lat, :numericality => true, :allow_blank => true   
  validates :long, :numericality => true, :allow_blank => true  
  validates :moisture, :numericality => true, :allow_blank => true  
  validates :pH, :numericality => true, :allow_blank => true  
  validates :temperature, :numericality => true, :allow_blank => true  
  validates :time, :numericality => true, :allow_blank => true  
end
