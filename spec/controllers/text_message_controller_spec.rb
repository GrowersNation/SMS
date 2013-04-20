require 'spec_helper'

describe TextMessageController do
  describe "POST #parse" do
    # context "with blank" do
    #    it 'renders the instruction template' do
    #      post :parse, 'Body' => ''
    #      response.should render_template 'instructions.xml'
    #    end
    #  end
    #  context "with info" do
    #    it 'renders the instruction template' do
    #      post :parse, 'Body' => 'info'
    #      response.should render_template 'instructions.xml'
    #    end
    #     
    #  end
    #  context "with start" do
    #    it 'renders the instruction template' do
    #      post :parse, 'Body' => 'info'
    #      response.should render_template 'instructions.xml'
    #    end
    #  end
    #  
    context "with data in format 9.5,37,70 ph,temp,moisture" do
      it 'renders the success template' do
        post :parse, 'Body' => '9.5, 37, 70'
        response.should render_template 'successful_sample.xml'
      end
      
      it 'saves the data to the database'
        
    end
  end
end
 