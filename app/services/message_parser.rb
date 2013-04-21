class MessageParser
  class << self
    
    def string_to_hash(str)
      str_seperated = create_array_of_key_values(str)
      split_into_hash(str_seperated)
    end
    
    
    def create_array_of_key_values(message)
      message.gsub(/\s*=\s*/, '=') # turn any key = value / key= value into key=value
             .split(/\s+|,/) # split on possible delineaters 
             .reject(&:blank?) 
    end

    def split_into_hash(data)
      params = {}
      data.each do |y|
        key, value = y.split('=')
        params[key] = value
      end    

      return params
    end
    
  end
end