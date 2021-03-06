class SoilSamplesController < ApplicationController
  before_filter :allow_all
  after_filter :cors_preflight_check
  
  # HACKS
  def allow_all
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS, HEAD, PUT, DELETE'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'

  end
  
  def cors_preflight_check
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
  end
  
  def xss_options_request
    render :text => ""
  end
  
  def index
   
      @soil_samples =  SoilSample.unscoped
      @soil_samples = @soil_samples.where(:device_id => params[:device_id])  if params[:device_id]
      @soil_samples = @soil_samples.where(:device => params[:device])  if params[:device]
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @soil_samples }
    end
  end
  
  def show
    @soil_sample = SoilSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @soil_sample }
    end
  end

  def new
    @soil_sample = SoilSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @soil_sample }
    end
  end

  # GET /soil_samples/1/edit
  def edit
    @soil_sample = SoilSample.find(params[:id])
  end

  def create
    puts params
    @soil_sample = SoilSample.new(params[:soil_sample])

    respond_to do |format|
      if @soil_sample.save
        format.html { redirect_to @soil_sample, notice: 'Soil sample was successfully created.' }
        format.json { render json: @soil_sample, status: :created, location: @soil_sample }
      else
        format.html { render action: "new" }
        format.json { render json: @soil_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @soil_sample = SoilSample.find(params[:id])

    respond_to do |format|
      if @soil_sample.update_attributes(params[:soil_sample])
        format.html { redirect_to @soil_sample, notice: 'Soil sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @soil_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @soil_sample = SoilSample.find(params[:id])
    @soil_sample.destroy

    respond_to do |format|
      format.html { redirect_to soil_samples_url }
      format.json { head :no_content }
    end
  end
end
