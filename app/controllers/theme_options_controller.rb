class ThemeOptionsController < ApplicationController
  before_action :set_subdomain
	before_action :authenticate_user!
  def index
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  end

  def homepage_content
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  end

  def template
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  	@templates = ThemeName.all
  end

  def homepage_gallery
    @themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
    @themeoptions.homepage_galleries.build
  end

  def theme_settings
    @themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  end

	def update
		@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
		# if params[:propertyinformations] && params[:propertyinformations].has_key?(:user_id)
		#   params[:propertyinformations].delete(:user_id) 
		# end
		respond_to do |format|
			session[:return_to] ||= request.referer
		  if @themeoptions.update(users_params)
		    format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
		    format.json { head :no_content }
		  else
		    format.html { render action: 'edit' }
		    format.json { render json: @themeoptions.errors, status: :unprocessable_entity }
		  end
		end
	end

  private	
    def set_subdomain
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @user                = User.where(id: @site.user_id).first
     
      @pages               = Page.where(site_id: @site.id).all
      @availabilities      = Availability.where(site_id: @site.id).all
      @propertyinformation = PropertyInformation.where(site_id: @site.id).first
      @contacts            = Contact.where(site_id: @site.id).all
    end

  	def users_params
      params.require(:theme_option).permit(:theme_image, 
      																		 :user_id, 
      																		 :homepage_heading, 
      																		 :homepage_subheading, 
      																		 :content,
      																		 :template,
                                           :homepage_image,
                                           :body_font,
                                           :heading_font,
                                           :show_logo,
                                           homepage_galleries_attributes: [:user_id, :id, :homepage_gallery_image, :site_id, :_destroy])
    end
end










































