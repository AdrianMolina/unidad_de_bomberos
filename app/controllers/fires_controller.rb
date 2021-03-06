class FiresController < ApplicationController
  before_action :set_fire, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /fires
  # GET /fires.json
  def index
    @fires = Fire.all
  end

  # GET /fires/1
  # GET /fires/1.json
  def show
    @emergency = Emergency.find(@fire.emergency_id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = IncendioPdf.new(@fire)
        send_data pdf.render, filename: "fire_#{@fire.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /fires/new
  def new
    @fire = Fire.new
    @emergency = Emergency.find(params[:id])
    #1.times {
    #  @fire.assist_fires.build
    #  @fire.fire_material_useds.build
    #  @fire.fire_affected_people.build
    #  @fire.fire_institutions.build
    #}
  end

  # GET /fires/1/edit
  def edit
    @emergency = Emergency.find(@fire.emergency_id)
  end

  # POST /fires
  # POST /fires.json
  def create
    @fire = Fire.new(fire_params)
    @emergency = Emergency.find(@fire.emergency_id)
    respond_to do |format|
      if @fire.save
        format.html { redirect_to @fire, notice: 'La informacion del formulario de incendios fue registrada con exito.' }
        format.json { render :show, status: :created, location: @fire }
      else
        format.html { render :new }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fires/1
  # PATCH/PUT /fires/1.json
  def update
    @emergency = Emergency.find(@fire.emergency_id)
    respond_to do |format|
      if @fire.update(fire_params)
        format.html { redirect_to @fire, notice: 'La informacion del formulario de incendios fue actualizada con exito.' }
        format.json { render :show, status: :ok, location: @fire }
      else
        format.html { render :edit }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fires/1
  # DELETE /fires/1.json
  def destroy
    @emergency = Emergency.find(@fire.emergency_id)
    @fire.destroy
    respond_to do |format|
      format.html { redirect_to formularios_path(@emergency), notice: 'Fire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fire
      @fire = Fire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fire_params
      params.require(:fire).permit(:numero_caso, :lugar_incidente, :hora_incidente, :descripcion_incidente, :jefe_brigada, :jefe_seguridad, :latitude, :longitude, :emergency_id, assist_fires_attributes: [:id, :user_id, :fire_id, :_destroy], fire_affected_people_attributes: [:id, :nombre, :telefono, :fire_id, :_destroy], fire_institutions_attributes: [:id, :nombre, :trabajo, :fire_id, :_destroy], fire_material_useds_attributes: [:id, :fire_id, :material_id, :_destroy])
    end
end
