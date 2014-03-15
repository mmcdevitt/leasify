class DashboardsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@sites = Site.where(user_id: current_user.id).all
  	if request.subdomain != "www" && request.subdomain.present?
	  	@subdomain           = request.subdomain
	    @site                = Site.where(subdomain: request.subdomain).first
	    @user                = User.where(id: @site.user_id).first
	    @themeoptions        = ThemeOption.where(site_id: @site.id).first
	    @pages               = Page.where(site_id: @site.id).all
	    @availabilities      = Availability.where(site_id: @site.id).all
	    @propertyinformation = PropertyInformation.where(site_id: @site.id).first
	  	@contacts            = Contact.where(site_id: @site.id).all
	  	@homepage_gallery    = HomepageGallery.where(site_id: @site.id).first
	  end
  end
end
