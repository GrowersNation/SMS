class RenameDbColumnsInSoilSample < ActiveRecord::Migration
  def up
    rename_column :soil_samples, :ph, :pH
    rename_column :soil_samples, :latitude, :lat
    rename_column :soil_samples, :longitude, :long
    
    
    
  end

  def down
  end
end
