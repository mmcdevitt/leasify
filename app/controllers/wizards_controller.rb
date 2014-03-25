class WizardsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_subdomain

	def templates
		@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
    @templates = ThemeName.all
	end

	def customize
		@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
    @templates = ThemeName.all
	end


	def set_subdomain
		@subdomain           = request.subdomain
		@site                = Site.where(subdomain: request.subdomain).first
		@user                = User.where(id: @site.user_id).first
		@pages               = Page.where(site_id: @site.id).all
		@availabilities      = Availability.where(site_id: @site.id).all
		@propertyinformation = PropertyInformation.where(site_id: @site.id).first
		@contacts            = Contact.where(site_id: @site.id).all
	end


end
