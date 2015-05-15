class ApplicationController < ActionController::Base
  include UrlHelper
  include SetSubdomain
  include DeviseHelper

  protect_from_forgery with: :exception
  before_action :set_subdomain
  before_action :correct_user
  before_action :sidebar_nav
  before_action :configure_devise_permitted_parameters, if: :devise_controller?


  # Define the correct user for each subdomain. Redirects unauthorized users to their
  # respective dashboards.
  def correct_user
    if request.subdomain.present? && request.subdomain != "www"
      if user_signed_in?
        if params[:controller] == 'static_pages' && params[:action] == 'home'
        elsif params[:controller] == 'pages' && params[:action] == 'show'
        elsif params[:controller] == 'static_pages' && params[:action] == 'leasing'
        elsif params[:controller] == 'availabilities' && params[:action] == 'show'
        else

          @subdomain = request.subdomain
          @site = Site.where(subdomain: request.subdomain).first
          @user = User.where(id: @site.user_id).first
          if @user.id != current_user.id
            redirect_to (root_url(:subdomain => false) + "dashboard")
            # sign_out(@user)
          end
        end
      end
    end
  end


  # User is redirected to users dashboard after sign in
  def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1 || current_user.username == "demo"
      new_site_path
    else
      dashboard_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if Rails.env.development?
      (root_url(:subdomain => false) )
    elsif Rails.env.production?
      root_url(:host => with_subdomain("www"))
    end
  end

  # Defines the front end template name for home action
  def theme_name
    if params[:action] == "home"
      @theme_name = ThemeOption.where(user_id: current_user.id).first.template.downcase
    else
      "application"
    end
  end

  # Sidebar Nav
  def sidebar_nav
    @sidebar_nav = SidebarLink.all
  end
end


































