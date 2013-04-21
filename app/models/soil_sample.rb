class SoilSample < ActiveRecord::Base
  attr_accessible :lat, :long, :moisture, :pH, :temperature, :time, :device_id, :comments
  
  validates :lat, :numericality => true    
  validates :long, :numericality => true
  validates :moisture, :numericality => true
  validates :pH, :numericality => true
  validates :temperature, :numericality => true
  validates :time, :numericality => true
end
