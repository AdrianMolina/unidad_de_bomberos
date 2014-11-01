class PreHospitalsController < ApplicationController
  before_action :set_pre_hospital, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pre_hospitals
  # GET /pre_hospitals.json
  def index
    @pre_hospitals = PreHospital.all
  end

  # GET /pre_hospitals/1
  # GET /pre_hospitals/1.json
  def show
    @emergency = Emergency.find(@pre_hospital.emergency_id)
  end

  # GET /pre_hospitals/new
  def new
    @pre_hospital = PreHospital.new
    @emergency = Emergency.find(params[:id])
    1.times {
      @pre_hospital.assist_pre_hospitals.build
    }
  end

  # GET /pre_hospitals/1/edit
  def edit
    @emergency = Emergency.find(@pre_hospital.emergency_id)
  end

  # POST /pre_hospitals
  # POST /pre_hospitals.json
  def create
    @pre_hospital = PreHospital.new(pre_hospital_params)

    respond_to do |format|
      if @pre_hospital.save
        format.html { redirect_to @pre_hospital, notice: 'Pre hospital was successfully created.' }
        format.json { render :show, status: :created, location: @pre_hospital }
      else
        format.html { render :new }
        format.json { render json: @pre_hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_hospitals/1
  # PATCH/PUT /pre_hospitals/1.json
  def update
    respond_to do |format|
      if @pre_hospital.update(pre_hospital_params)
        format.html { redirect_to @pre_hospital, notice: 'Pre hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_hospital }
      else
        format.html { render :edit }
        format.json { render json: @pre_hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_hospitals/1
  # DELETE /pre_hospitals/1.json
  def destroy
    @emergency = Emergency.find(@pre_hospital.emergency_id)
    @pre_hospital.destroy
    respond_to do |format|
      format.html { redirect_to formularios_path(@emergency), notice: 'Pre hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_hospital
      @pre_hospital = PreHospital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_hospital_params
      params.require(:pre_hospital).permit(:numero_caso, :hora_incidente, :accidente_vehicular, :peritaje_vehicular, :trauma, :diagnostico, :prioridad_traslado, :desarrollo_atencion, :pertenencias_victima, :emergency_id, :latitude, :longitude, :lugar_incidente, assist_pre_hospitals_attributes: [:id, :user_id, :pre_hospital_id, :_destroy])
    end
end
