class AndroidsController < ApplicationController
	before_action :set_emergency, only: [:show, :edit, :update, :destroy]
	def index
    @androids = Android.all
  end
  def register_phone
		@android = Android.new
    	@android.registrationId = params[:registrationId]
    	@android.nombre = params[:nombre]
		if @android.save
			render json: '{"res": true}'
		else
			render json: '{"res": false}'
		end 
	end
	def update_position
		@android = Android.find_by_registrationId(params[:registrationId])
    #@android = Android.all.last
    	@android.latitude = params[:latitude]
		@android.longitude = params[:longitude]
		@android.emergency_id = params[:id]
		@android.save
	end
  def edit
  end
  def update
    respond_to do |format|
      if @android.update(android_params)
        format.html { redirect_to @android, notice: 'el dispositivo fue actualizado con exito' }
        format.json { render :show, status: :ok, location: @android }
      else
        format.html { render :edit }
        format.json { render json: @android.errors, status: :unprocessable_entity }
      end
    end
  end
  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency
      @android = Android.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_params
      params.require(:android).permit(:registrationId, :nombre)
    end
end
