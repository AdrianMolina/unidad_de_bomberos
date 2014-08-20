class RescuesController < ApplicationController
  before_action :set_rescue, only: [:show, :edit, :update, :destroy]

  # GET /rescues
  # GET /rescues.json
  def index
    @rescues = Rescue.all
  end

  # GET /rescues/1
  # GET /rescues/1.json
  def show
    @emergency = Emergency.find(@rescue.emergency_id)
  end

  # GET /rescues/new
  def new
    @rescue = Rescue.new
    @emergency = Emergency.find(params[:id])
    1.times {  
      @rescue.assist_rescues.build 
      @rescue.rescue_affected_people.build
    }
  end

  # GET /rescues/1/edit
  def edit
    @emergency = Emergency.find(@rescue.emergency_id)
  end

  # POST /rescues
  # POST /rescues.json
  def create
    @rescue = Rescue.new(rescue_params)

    respond_to do |format|
      if @rescue.save
        format.html { redirect_to @rescue, notice: 'Rescue was successfully created.' }
        format.json { render :show, status: :created, location: @rescue }
      else
        format.html { render :new }
        format.json { render json: @rescue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rescues/1
  # PATCH/PUT /rescues/1.json
  def update
    respond_to do |format|
      if @rescue.update(rescue_params)
        format.html { redirect_to @rescue, notice: 'Rescue was successfully updated.' }
        format.json { render :show, status: :ok, location: @rescue }
      else
        format.html { render :edit }
        format.json { render json: @rescue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rescues/1
  # DELETE /rescues/1.json
  def destroy
    @rescue.destroy
    respond_to do |format|
      format.html { redirect_to rescues_url, notice: 'Rescue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rescue
      @rescue = Rescue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rescue_params
      params.require(:rescue).permit(:numero_caso, :lugar_incidente, :hora_incidente, :descripcion_incidente, :observaciones, :danos_materiales, :jefe_brigada, :jefe_seguridad, :latitude, :longitude, :emergency_id, assist_rescues_attributes: [:id, :user_id, :rescue_id, :_destroy], rescue_affected_people_attributes: [:id, :nombre, :telefono, :rescue_id, :_destroy])
    end
end
