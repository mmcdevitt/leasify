class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.where(user_id: current_user.id).all
    redirect_to dashboard_path
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find_by_subdomain(request.subdomain)
  end

  # GET /sites/new
  def new
    @site = Site.new
    @site.theme_options.build
    @site.property_informations.build
    @sites = Site.where(user_id: current_user.id).all
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to dashboard_path, notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :subdomain, :user_id, 
                                   theme_options_attributes: [:user_id, :id, :content, :template],
                                   property_informations_attributes: [:user_id, :id])
    end
end














































