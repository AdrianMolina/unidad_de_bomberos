class UsersController < ApplicationController
	before_action :set_emergency, only: [:show, :edit, :update, :destroy]
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to index_users_path, notice: 'user was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre, :apellido, :rango, :email, :password,:password_confirmation)
    end
end