require 'spec_helper'

describe TextMessageController do
  describe "POST #parse" do
    context "with blank" do
        it 'renders the instruction template' do
          post :parse, 'Body' => ''
          response.should render_template 'instructions.xml'
        end
      end
      context "with info" do
        it 'renders the instruction template' do
          post :parse, 'Body' => 'info'
          response.should render_template 'instructions.xml'
        end
         
      end
      context "with start" do
        it 'renders the instruction template' do
          post :parse, 'Body' => 'info'
          response.should render_template 'instructions.xml'
        end
      end
      
    # context "with data in format 9.5,37,70 ph,temp,moisture" do
    #   it 'renders the success template' do
    #     post :parse, 'Body' => '9.5, 37, 70'
    #     response.should render_template 'successful_sample.xml'
    #   end
    #   
    #   it 'saves the data to the database'
    #     
    # end
    
    context "with data ph=7.9,temp=31.3,lat=51.112,long=52.1223,moisture=21 " do
      it 'renders success' do
        post :parse, 'Body' => 'ph=7.9,temp=31.3,lat=51.112,long=52.1223,moisture=21'
        response.should render_template 'successful_sample.xml'
      end
    end
    
    context "with data info corn long=56.111 lat=56.222" do
      it 'renders success' do
        post :parse, 'Body' => 'info corn long=56.111 lat=56.222'
        response.should render_template 'crop_info.xml'
      end
    end
    
    context "with data info corn long=56.111" do
      it 'renders success' do
        post :parse, 'Body' => 'info corn long=56.111 '
        response.should render_template 'incorrect_format.xml'
      end
    end
  end
end
 