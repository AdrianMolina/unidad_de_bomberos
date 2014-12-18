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
end
