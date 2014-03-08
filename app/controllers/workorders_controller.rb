class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]
  before_action :load_client, :load_location,  :load_franchise, only: [:destroy, :new, :edit, :update, :show, :index, :create]

  # GET /workorders
  # GET /workorders.json
  def index
    @workorders = @franchise.workorders
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
  end

  # GET /workorders/new
  def new
    @workorder = @franchise.workorders.new
  end

  # GET /workorders/1/edit
  def edit
  end

  # POST /workorders
  # POST /workorders.json
  def create
  
    @workorder = Workorder.new(workorder_params)

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to [@client,@location,@franchise, @workorder], notice: 'Workorder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workorder }
      else
        format.html { render action: 'new' }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workorders/1
  # PATCH/PUT /workorders/1.json
  def update
    respond_to do |format|
      if @workorder.update(workorder_params)
        format.html { redirect_to [[@client,@location, @franchise,@workorder]], notice: 'Workorder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    @workorder.destroy
    respond_to do |format|
      format.html { redirect_to client_location_franchise_workorders_path(@client, @location, @franchise) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end
    
    def load_franchise
      @franchise = Franchise.find(params[:franchise_id])
    end

    def load_client
      @client = Client.find(params[:client_id])
    end

    def load_location
      @location = Location.find(params[:location_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workorder_params
      params.require(:workorder).permit(:number, :po, :estimate_id, :line_item, :quantity, :price, :previous_action, :next_action_due, :schedule, :invoice, :invoice_total, :notes, :franchise_id, :location_id)
    end
end
