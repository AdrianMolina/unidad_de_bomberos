class AndroidsController < ApplicationController
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
end
