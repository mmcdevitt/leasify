class ThemeOptionsController < ApplicationController
  before_action :set_subdomain
	before_action :authenticate_user!
  before_action :redirect_if_www
  def index
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  end

  def homepage_content
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  end

  def template
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
  	@templates = ThemeName.where(published: true).all
  end

  def template_preview
    @themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
    @templates = ThemeName.where(published: true).all
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
      if request.subdomain.present? && request.subdomain != "www"
        @subdomain           = request.subdomain
        @site                = Site.where(subdomain: request.subdomain).first
        @user                = User.where(id: @site.user_id).first
        @pages               = Page.where(site_id: @site.id).all
        @availabilities      = Availability.where(site_id: @site.id).all
        @propertyinformation = PropertyInformation.where(site_id: @site.id).first
        @contacts            = Contact.where(site_id: @site.id).all
      end
    end

    def redirect_if_www
      if !request.subdomain.present? || request.subdomain == "www"
        redirect_to dashboard_path
      end
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
                                           :mainheading_size,
                                           :subheading_size,
                                           :nav_size,
                                           :footer_size,
                                           :body_size,
                                           :mainheading_color,
                                           :subheading_color,
                                           :body_color,
                                           :footer_color,
                                           :nav_color,
                                           :navhover_color,
                                           :body_heading_color,
                                           :link_color,
                                           :page_title_size,
                                           :page_subtitle_size,
                                           :page_title_color,
                                           :page_subtitle_color,
                                           :heading_text_transform,
                                           homepage_galleries_attributes: [:user_id, :id, :homepage_gallery_image, :site_id, :_destroy])
    end
end










































