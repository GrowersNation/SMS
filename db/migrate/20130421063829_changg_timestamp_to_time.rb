class ChanggTimestampToTime < ActiveRecord::Migration
  def up
    rename_column :soil_samples, :timestamp, :time 
  end

  def down
  end
end
