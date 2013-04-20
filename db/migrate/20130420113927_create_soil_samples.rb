class CreateSoilSamples < ActiveRecord::Migration
  def change
    create_table :soil_samples do |t|
      t.float :ph
      t.float :longitude
      t.float :latitude
      t.float :moisture
      t.float :temperature

      t.timestamps
    end
  end
end
