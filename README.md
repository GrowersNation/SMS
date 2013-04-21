# Text Message Parsing for Soil Readings and Soil Information Service
## Part of the People Of The Soil/Growers Nation project, co-winners of the London Nasa Space Apps Challenge 2013

Combining Twilio and Ruby on Rails for receiving soil measurement data and giving growing information via text message. Project aims to enable those people in rural areas and less economically developed countries who do not have access to the internet the ability to obtain localised information for growing crops via text message. It also allows people to contribute to the overall project by allowing them to submit there own soil sample readings.

# Example

## Crop Growing Information

Send a text to ``01952 787011`` with the following format

    info corn lat=51.9972 long=-0.7421 # info <crop> <options>
    
You will receive back the growing information for that crop at that specific location based on the in development growers nation API. Currently returns a stock response and only takes the options **long/longitude lat/latitude**

## Submitting soil readings via text message

Send a text to ``01952 787011`` containing a list of readings for the following parameters pH, temperature, moisture, lat/latitude and long/longitude and then will be added to the dataset. The list of key, values can be separated by whitespace or , delimited and the order doesn't matter

    pH = 7.2, lat=51.9972, long=-0.7421, temp=35
    
You will receive back a message confirming the data your sent and that it had been saved to the database. This service can interact with another in-development Growers Nation API

## TODO

* Localisation support for different languages
* Validations of the data
* Connection to the real API's      



    
    