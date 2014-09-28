class UsersController < ApplicationController
	before_action :set_user, only: [:show_user, :edit, :update, :cambio_de_estado_usuario]
	before_action :authenticate_user!
	def index
		@users = User.all
	end

	def show_user
  	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		@user.estado = "activo" #deberia ser bool y no un string
	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to index_users_path, notice: 'user was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	def update
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to show_user_path(@user), notice: 'user was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
  	end

	def cambio_de_estado_usuario
	    if @user.estado == "activo"
	    	@user.estado = "inactivo"
	    	@user.save
	    	redirect_to index_users_path
	    else
	    	@user.estado = "activo"
	    	@user.save
	    	redirect_to index_users_path
	    end
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre, :apellido, :rango, :email, :password, :password_confirmation, :estado, :ap_materno, :escalafon, :especialidad, :telefono, :celular, :fecha_nacimiento, :egreso, :institucion, :cargo, :username)
    end
end