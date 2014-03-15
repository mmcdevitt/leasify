class HomepageGalleriesController < ApplicationController
	before_action :set_subdomain
	before_action :authenticate_user!, except: [:show]

	def index
		@homepage_gallery = HomepageGallery.new
	end

	def create
    @homepage_gallery = current_user.homepage_galleries.new(homepage_gallery_params)

    respond_to do |format|
      if @homepage_gallery.save
      	session[:return_to] ||= request.referer
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @homepage_gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @homepage_gallery.errors, status: :unprocessable_entity }
      end
    end
  end


  def set_subdomain
      @subdomain            = request.subdomain
      @site                 = Site.where(subdomain: request.subdomain).first
      @user                 = User.where(id: @site.user_id).first
      @themeoptions         = ThemeOption.where(site_id: @site.id).first
      @pages                = Page.where(site_id: @site.id).all
      @availabilities       = Availability.where(site_id: @site.id).all
      @propertyinformation  = PropertyInformation.where(site_id: @site.id).first
      @contacts             = Contact.where(site_id: @site.id).all
     
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homepage_gallery_params
      params.require(:homepage_gallery).permit(:user_id, :site_id, :homepage_gallery_image, :_destroy) 
    end









end