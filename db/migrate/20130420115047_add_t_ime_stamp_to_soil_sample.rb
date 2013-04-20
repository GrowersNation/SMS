class AddTImeStampToSoilSample < ActiveRecord::Migration
  def change
    add_column :soil_samples, :timestamp, :integer
  end
end
