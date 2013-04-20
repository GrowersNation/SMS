class SoilSample < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :moisture, :ph, :temperature
end
