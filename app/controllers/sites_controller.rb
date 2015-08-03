class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  layout :layouts

  def index
    @sites = Site.where(user_id: current_user.id).all
    redirect_to dashboard_path
  end

  def show
    @site = Site.find_by_subdomain(request.subdomain)
  end

  def new
    @site = Site.new
    @site.theme_options.build
    @site.property_informations.build
    @sites = Site.where(user_id: current_user.id).all
  end

  def edit
    @sites = Site.where(user_id: current_user.id).all
  end

  def redirect
    # Redirect user to site wizard after creating new subdomain
    @site_last = Site.where(user_id: current_user.id).last
    redirect_to root_url(:host => with_subdomain(@site_last.subdomain)) + 'dashboard/wizard/property'
  end

  def create
    @sites = Site.where(user_id: current_user.id).all
    @site = current_user.sites.new(site_params)


    respond_to do |format|
      if @site.save
        format.html { redirect_to redirect_path, notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
    def layouts
      "sites_new" if params[:action] == 'new'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :subdomain, :user_id,
                                   theme_options_attributes: [:user_id, :id, :content, :template],
                                   property_informations_attributes: [:user_id, :id, :name])
    end

    # def set_subdomain
    #   @subdomain           = request.subdomain
    #   @site                = Site.where(subdomain: request.subdomain).first
    #   @user                = User.where(id: @site.user_id).first
    #   @themeoptions        = ThemeOption.where(site_id: @site.id).first
    #   @pages               = Page.where(site_id: @site.id).all
    #   @availabilities      = Availability.where(site_id: @site.id).all
    #   @propertyinformation = PropertyInformation.where(site_id: @site.id).first
    #   @contacts            = Contact.where(site_id: @site.id).all
    # end
end














































