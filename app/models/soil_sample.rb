class SoilSample < ActiveRecord::Base
  attr_accessible :lat, :long, :moisture, :pH, :temperature, :timestamp 
end
