class InstitutionListsController < ApplicationController
  before_action :set_institution_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /institution_lists
  # GET /institution_lists.json
  def index
    @institution_lists = InstitutionList.all
    @institution_lists = Kaminari.paginate_array(@institution_lists).page(params[:page]).per(6)
  end

  # GET /institution_lists/1
  # GET /institution_lists/1.json
  def show
  end

  # GET /institution_lists/new
  def new
    @institution_list = InstitutionList.new
  end

  # GET /institution_lists/1/edit
  def edit
  end

  # POST /institution_lists
  # POST /institution_lists.json
  def create
    @institution_list = InstitutionList.new(institution_list_params)

    respond_to do |format|
      if @institution_list.save
        format.html { redirect_to @institution_list, notice: 'Institution list was successfully created.' }
        format.json { render :show, status: :created, location: @institution_list }
      else
        format.html { render :new }
        format.json { render json: @institution_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institution_lists/1
  # PATCH/PUT /institution_lists/1.json
  def update
    respond_to do |format|
      if @institution_list.update(institution_list_params)
        format.html { redirect_to @institution_list, notice: 'Institution list was successfully updated.' }
        format.json { render :show, status: :ok, location: @institution_list }
      else
        format.html { render :edit }
        format.json { render json: @institution_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_lists/1
  # DELETE /institution_lists/1.json
  def destroy
    @institution_list.destroy
    respond_to do |format|
      format.html { redirect_to institution_lists_url, notice: 'Institution list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution_list
      @institution_list = InstitutionList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institution_list_params
      params.require(:institution_list).permit(:sigla, :nombre)
    end
end
