class StaticPagesController < ApplicationController
  layout :theme_name
  
  def home
    @subdomain           = request.subdomain
    @user                = User.where(username: @subdomain).first.id
    @themeoptions        = ThemeOption.where(user_id: @user).first
    @pages               = Page.where(user_id: @user).all
    @availabilities      = Availability.where(user_id: @user).all
    @propertyinformation = PropertyInformations.where(user_id: @user).first
  end

  def show
    @page = Page.find(params[:id])
  end

  #signup method to change layout of user registration and login pages
    def theme_name
      @user = User.where(username: @subdomain).first.id
      if params[:action] == "home"
        @theme_name = ThemeOption.where(user_id: @user).first.template.downcase
      else
        "application"
      end
    end


end
