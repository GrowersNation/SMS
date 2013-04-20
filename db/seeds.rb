# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create_table "soil_samples", :force => true do |t|
#   t.float    "ph"
#   t.float    "longitude"
#   t.float    "latitude"
#   t.float    "moisture"
#   t.float    "temperature"
#   t.datetime "created_at",  :null => false
#   t.datetime "updated_at",  :null => false
# end

100.times do 
  SampleSample.create(:ph => Random.rand(14.0).round(2),
                      :timestamp => Time.now - Random.rand(100),
                      :latitude => Random.rand(180.0) - 90,
                      :longitude => Random.rand(360) - 180,
                      :temperature => Random.ran(40.0))
end