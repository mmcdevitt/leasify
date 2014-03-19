class ThemeNamesController < ApplicationController
  before_action :set_theme_name, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_role
  # GET /theme_names
  # GET /theme_names.json
  def index
    @theme_names = ThemeName.all
  end

  # GET /theme_names/1
  # GET /theme_names/1.json
  def show
  end

  # GET /theme_names/new
  def new
    @theme_name = ThemeName.new
    @title = "New Theme"
  end

  # GET /theme_names/1/edit
  def edit
    @title = @theme_name.name
  end

  # POST /theme_names
  # POST /theme_names.json
  def create
    @theme_name = ThemeName.new(theme_name_params)

    respond_to do |format|
      if @theme_name.save
        format.html { redirect_to admin_theme_edit_path(@theme_name), notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @theme_name }
      else
        format.html { render action: 'new' }
        format.json { render json: @theme_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theme_names/1
  # PATCH/PUT /theme_names/1.json
  def update
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @theme_name.update(theme_name_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theme_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theme_names/1
  # DELETE /theme_names/1.json
  def destroy
    @theme_name.destroy
    respond_to do |format|
      format.html { redirect_to theme_names_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme_name
      @theme_name = ThemeName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_name_params
      params.require(:theme_name).permit(:name, :user_id, :description, :theme_name_image)
    end

    def admin_role
      unless current_user.admin?
        redirect_to dashboard_path
      end
    end
end
































