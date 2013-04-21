require 'spec_helper'

describe MessageParser do
  it 'returns correctly formatted string given input' do
    MessageParser.string_to_hash('a = 2, b= 4 c =4').should == {'a' => '2', 'b' => '4', 'c' => '4'}
    MessageParser.string_to_hash('a = 2 b= 4 c =4').should == {'a' => '2', 'b' => '4', 'c' => '4'}
    MessageParser.string_to_hash('a=2 b=4 c=4').should == {'a' => '2', 'b' => '4', 'c' => '4'}
    MessageParser.string_to_hash('a=2,b=4,c=4').should == {'a' => '2', 'b' => '4', 'c' => '4'}
  end

end
