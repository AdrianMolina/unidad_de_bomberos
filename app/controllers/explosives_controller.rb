class ExplosivesController < ApplicationController
  before_action :set_explosive, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /explosives
  # GET /explosives.json
  def index
    @explosives = Explosive.all
  end

  # GET /explosives/1
  # GET /explosives/1.json
  def show
    @emergency = Emergency.find(@explosive.emergency_id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ExplosivoPdf.new(@explosive)
        send_data pdf.render, filename: "explosive#{@explosive.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /explosives/new
  def new
    @explosive = Explosive.new
    @emergency = Emergency.find(params[:id])
    #1.times {  
     #@explosive.assists.build
     #@explosive.explosive_material_useds.build
     #@explosive.affected_people.build 
     #@explosive.institutions.build 
    #}
  end

  # GET /explosives/1/edit
  def edit
    @emergency = Emergency.find(@explosive.emergency_id)
  end

  # POST /explosives
  # POST /explosives.json
  def create
    @explosive = Explosive.new(explosive_params)
    @emergency = Emergency.find(@explosive.emergency_id)
    respond_to do |format|
      if @explosive.save
        format.html { redirect_to @explosive, notice: 'La informacion del formulario de explosivos fue registrada con exito.' }
        format.json { render :show, status: :created, location: @explosive }
      else
        format.html { render :new }
        format.json { render json: @explosive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explosives/1
  # PATCH/PUT /explosives/1.json
  def update
    @emergency = Emergency.find(@explosive.emergency_id)
    respond_to do |format|
      if @explosive.update(explosive_params)
        format.html { redirect_to @explosive, notice: 'La informacion del formulario de explosivos fue actualizada con exito.' }
        format.json { render :show, status: :ok, location: @explosive }
      else
        format.html { render :edit }
        format.json { render json: @explosive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explosives/1
  # DELETE /explosives/1.json
  def destroy
    @emergency = Emergency.find(@explosive.emergency_id)
    @explosive.destroy
    respond_to do |format|
      format.html { redirect_to formularios_path(@emergency), notice: 'Explosive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explosive
      @explosive = Explosive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explosive_params
      params.require(:explosive).permit(:numero_caso, :fecha, :lugar_incidente, :hora_incidente, :descripcion_incidente, :material_utilizado, :observaciones_incidente, :jefe_brigada, :jefe_seguridad, :emergency_id, :latitude, :Longitude, assists_attributes: [:id, :user_id, :explosive_id, :_destroy], explosive_material_useds_attributes: [:id, :explosive_id, :material_id, :_destroy], affected_people_attributes: [:id, :nombre, :telefono, :explosive_id, :_destroy], institutions_attributes: [:id, :nombre, :trabajo, :explosive_id, :_destroy])
    end
end
