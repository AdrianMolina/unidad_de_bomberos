class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:emergencias_en_curso]
  # GET /emergencies
  # GET /emergencies.json
  def index
    #@emergencies = Emergency.all.reverse
    @emergencies = Emergency.busqueda_index(params[:search], params[:date], params[:fecha_fin])
    #if params[:search] 
     # @emergencies_reverse = Emergency.search(params[:search]).reverse
     # @emergencies = Kaminari.paginate_array(@emergencies_reverse).page(params[:page]).per(4)
    #else
    @emergencies = Kaminari.paginate_array(@emergencies).page(params[:page]).per(4)
    #end
  end
  #muestra las emergencias activas o en curso
  def index_last
    @emergencies = Emergency.where(:estado => 'f')
    @emergencies = Kaminari.paginate_array(@emergencies).page(params[:page]).per(10)
    Android.all.delete_all
  end
  #muestra las emergencias activas o en curso post
  def emergencias_en_curso
    @emergencies = Emergency.where(:estado => 'f')
    render json: @emergencies
  end
  #reporte de emergencias
  def report_emergencies
    @emergencies = Emergency.busqueda(params[:types], params[:search], params[:fecha_fin])
  end

  # GET /emergencies/1
  # GET /emergencies/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EmergenciaPdf.new(@emergency)
        send_data pdf.render, filename: "emergency_#{@emergency.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /emergencies/new
  def new
    @emergency = Emergency.new
  end

  # GET /emergencies/1/edit
  def edit
  end

  # POST /emergencies
  # POST /emergencies.json
  def create
    @emergency = Emergency.new(emergency_params)
    @emergency.user_id = current_user.id
    respond_to do |format|
      if @emergency.save
        mensaje = NotificationSender.new(Android.all,@emergency)
        format.html { redirect_to @emergency, notice: 'La emergencia ha sido creada.' }
        format.json { render :show, status: :created, location: @emergency }
      else
        format.html { render :new }
        format.json { render json: @emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergencies/1
  # PATCH/PUT /emergencies/1.json
  def update
    respond_to do |format|
      if @emergency.update(emergency_params)
        format.html { redirect_to @emergency, notice: 'La emergencia fue actualizada con exito' }
        format.json { render :show, status: :ok, location: @emergency }
      else
        format.html { render :edit }
        format.json { render json: @emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencies/1
  # DELETE /emergencies/1.json
  def destroy
    @emergency.destroy
    respond_to do |format|
      format.html { redirect_to emergencies_url, notice: 'Emergency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def formularios
    @emergencia = Emergency.find(params[:id])
    @explosivos = Explosive.all
    @incendios = Fire.all
    @rescates = Rescue.all
    @atencion = PreHospital.all
  end

  def activo
    @emergency = Emergency.find(params[:id])
    if @emergency.estado == false
      @emergency.estado = true
    else
      @emergency.estado = false
    end
    @emergency.save
    redirect_to index_last_path
  end
  def location_loqsea
    @location = Android.all.last
    render json: @location

  end
  def prueba
    #@android = Android.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency
      @emergency = Emergency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_params
      params.require(:emergency).permit(:lugar, :denunciante, :telefono_denunciante, :numero_caso, :hora_salida, :observacion, :referencia_lugar, :tipo, :latitude, :longitude, :user_id, :vehicle_id, :estado)
    end
end
