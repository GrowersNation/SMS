# Text Message Parsing for Soil Readings

Combining Twilio and Ruby on Rails for receiving soil measurement data and giving growing information via text message.

# Example

## Crop Growing Information

Send a text to ``01952 787011`` with the following format

    info corn lat=51.9972 long=-0.7421 # info <crop> <options>
    
You will receive back the growing information for that crop at that specific location based on the in development growers nation API. Currently returns a stock response

## Submitting soil readings via text message

Send a text to ``01952 787011`` containing a list of readings for the following parameters pH, temperature, moisture, lat/latitude and long/longitude and then will be added to the dataset. The list of key, values can be seperatd by whitespace or , delimited and the order doesnt matter

    pH = 7.2, lat=51.9972, long=-0.7421, temp=35
    
You will receive back a message confirming the data your sent and that it had been saved to the database. This service can interact with another in-development growers nation API
    



    
    