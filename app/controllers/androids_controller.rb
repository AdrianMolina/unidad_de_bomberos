class AndroidsController < ApplicationController
	def register_phone
		@android = Android.new
    	@android.registrationId = params[:registrationId]
		if @android.save
			render json: '{"res": true}'
		else
			render json: '{"res": false}'
		end 
	end
	def update_position
		@android = Android.find_by_registrationId(params[:registrationId])
		@android.latitude = params[:latitude]
		@android.longitude = params[:longitude]
		@android.save
	end
end
