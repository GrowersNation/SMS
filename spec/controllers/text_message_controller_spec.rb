require 'spec_helper'

describe TextMessageController do
  render_views
  
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
      it 'renders incorrect format' do
        post :parse, 'Body' => 'info corn long=56.111 '
        response.should render_template 'incorrect_format.xml'
      end
    end
    
    context "with data info blaaa blooo dasd asd" do
      it 'renders incorrect format' do
        post :parse, 'Body' => 'info blaaa blooo dasd asd'
        response.should render_template 'incorrect_format.xml'
      end
    end
    
    # context "with data blaaa blooo dasd asd" do
    #   it 'renders error' do
    #     post :parse, 'Body' => 'blaaa blooo dasd asd'
    #     response.should render_template 'unknown_command.xml'
    #   end
    # end
  end
end
 