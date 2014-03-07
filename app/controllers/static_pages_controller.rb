class StaticPagesController < ApplicationController
  layout :theme_name
  
  def home
    if request.subdomain != "www" && request.subdomain.present?
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @user                = User.where(id: @site.user_id).first
      @themeoptions        = ThemeOption.where(site_id: @site.id).first
      @pages               = Page.where(site_id: @site.id).all
      @availabilities      = Availability.where(site_id: @site.id).all
      @propertyinformation = PropertyInformation.where(site_id: @site.id).first
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  #signup method to change layout of user registration and login pages
    def theme_name
      if params[:action] == "home" 
        if request.subdomain != "www" && request.subdomain.present?
          @subdomain = request.subdomain
          @site = Site.where(subdomain: request.subdomain).first
          @user = User.where(id: @site.user_id).first
          @theme_name = ThemeOption.where(site_id: @site.id).first.template.downcase
        else
          "test"
        end
      end
    end


end
