class FranchisesController < ApplicationController
  before_action :load_client, :load_location, :set_franchise, only: [:show, :edit, :update, :destroy]

  # GET /franchises
  # GET /franchises.json
  def index
    @client = Client.find(params[:client_id])
    @location = Client.location.find(params[:location_id])
    @franchise - Client.location.franchise.order(:name)
    #@franchises = Franchise.all
  end

  # GET /franchises/1
  # GET /franchises/1.json
  def show
    @franchise = @client.location.franchise.find(params[:id])
  end

  # GET /franchises/new
  def new
    @client = Client.find(params[:client_id])
    @location = Client.location.find(params[:client_id])
    @franchise = @client.location.franchise.new
  end

  # GET /franchises/1/edit
  def edit
    @franchise = @client.location.franchises.find(params[:id])
  end

  # POST /franchises
  # POST /franchises.json
  def create
    @franchise = @client.franchises.new(franchise_params)

    respond_to do |format|
      if @franchise.save
        format.html { redirect_to [@client, @franchise], notice: 'Franchise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @franchise }
      else
        format.html { render action: 'new' }
        format.json { render json: @franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchises/1
  # PATCH/PUT /franchises/1.json
  def update
    respond_to do |format|
      if @franchise.update(franchise_params)
        format.html { redirect_to [@client, @location, @franchise], notice: 'Franchise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchises/1
  # DELETE /franchises/1.json
  def destroy
    @franchise.destroy
    respond_to do |format|
      format.html { redirect_to client_location_franchises_path(@client) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchise
      @franchise = Franchise.find(params[:id])
    end

    def load_client
      @client = Client.find(params[:client_id])
    end

    def load_location
      @location = Client.location.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchise_params
      params.require(:franchise).permit(:number, :name, :phone, :email, :location_id, 
          location: [:id, :code, :address1, :address2, :city, :state, :zip, :phone, :email, :client_id])
    end
end
