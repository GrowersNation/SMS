class AddDeviceIdSAndDevice < ActiveRecord::Migration
  def change
    add_column :soil_samples, :device_id, :string
    add_column :soil_samples, :comments, :text
    add_column :soil_samples, :device, :string
  end
  
  def migrate(direction)
    super
      if direction == :up
        n = 10
        SoilSample.all.each do |sample|
      
          sample.device_id = '$LW1000' + (n /10).to_s
          sample.comments = ['The soil was wet', 'The soil had lots of clay', 'The soil was dry', 'The soil had many bugs'].sample
          sample.device = ['phone', 'probe'].sample
          sample.save
          n+=1
      end
    end
  end
end

# device 
# device id (query by)
# comments text field