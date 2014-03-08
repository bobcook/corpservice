class LocationsController < ApplicationController
  before_action :load_client, only: [:index,:show, :edit, :update, :destroy]
before_action :set_location, only: [:show, :edit, :update, :destroy]
  # GET /locations
  # GET /locations.json
  def index
    @client.locations.order(:zip)
    #@locations = @client.locations.all
  end

  # GET /locations/1
  # GET /locations/1.json

  def show
    #@client = Client.find(params[:client_id])
    #@location = @client.locations.find(params[:id])
  end

  # GET /locations/new
  def new
    @client = Client.find(params[:client_id])
    @location = @client.locations.new
  end

  # GET /locations/1/edit
  def edit
    #@location = @client.locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @client = Client.find(params[:client_id])
    @location = @client.locations.create(location_params)
    #redirect_to client_path(@client)
    
    respond_to do |format|
      if @location.save
        format.html { redirect_to [@client, @location], notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to [@client, @location], notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    redirect_to client_locations_path(@client)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_client
      @client = Client.find(params[:client_id])
    end

    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:id, :code, :address1, :address2, :city, :state, :zip, :phone, :email, :client_id,
                                client: [:id, :account, :contact, :phone, :email])
    end
end
