class ExplosivesController < ApplicationController
  before_action :set_explosife, only: [:show, :edit, :update, :destroy]

  # GET /explosives
  # GET /explosives.json
  def index
    @explosives = Explosive.all
  end

  # GET /explosives/1
  # GET /explosives/1.json
  def show
  end

  # GET /explosives/new
  def new
    @explosife = Explosive.new
  end

  # GET /explosives/1/edit
  def edit
  end

  # POST /explosives
  # POST /explosives.json
  def create
    @explosife = Explosive.new(explosife_params)

    respond_to do |format|
      if @explosife.save
        format.html { redirect_to @explosife, notice: 'Explosive was successfully created.' }
        format.json { render :show, status: :created, location: @explosife }
      else
        format.html { render :new }
        format.json { render json: @explosife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explosives/1
  # PATCH/PUT /explosives/1.json
  def update
    respond_to do |format|
      if @explosife.update(explosife_params)
        format.html { redirect_to @explosife, notice: 'Explosive was successfully updated.' }
        format.json { render :show, status: :ok, location: @explosife }
      else
        format.html { render :edit }
        format.json { render json: @explosife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explosives/1
  # DELETE /explosives/1.json
  def destroy
    @explosife.destroy
    respond_to do |format|
      format.html { redirect_to explosives_url, notice: 'Explosive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explosife
      @explosife = Explosive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explosife_params
      params.require(:explosife).permit(:numero_caso, :fecha, :lugar_incidente, :hora_incidente, :descripcion_incidente, :material_utilizado, :observaciones_incidente, :jefe_brigada, :jefe_seguridad, :emergency_id)
    end
end
