class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include UrlHelper
 
  protect_from_forgery with: :exception
  before_action :set_subdomain
  before_action :correct_user
  before_action :sidebar_nav
  # layout :theme_name

  #Allow Devise to add custom fields in database
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  protected
  def configure_devise_permitted_parameters
    registration_params = [:first_name,
                           :last_name,
                           :username, 
                           :email, 
                           :password, 
                           :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :password, 
                                            :password_confirmation, 
                                            :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  # End Devise #############

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
    (root_url(:subdomain => false) )
  end

  # Defines the front end template name for home action 
  def theme_name
    if params[:action] == "home"
      @theme_name = ThemeOption.where(user_id: current_user.id).first.template.downcase
    else
      "application"
    end
  end

  # Find user information through unique subdomain
  def set_subdomain
    if request.subdomain != "www" && request.subdomain.present?
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @user                = User.where(id: @site.user_id).first
      @themeoptions        = ThemeOption.where(site_id: @site.id).first
      @pages               = Page.where(site_id: @site.id).all
      @availabilities      = Availability.where(site_id: @site.id).all
      @propertyinformation = PropertyInformation.where(site_id: @site.id).first
      @contacts            = Contact.where(site_id: @site.id).all
    else
      if user_signed_in?
        @sites = Site.where(user_id: current_user.id).all
      end
    end
  end

  # Sidebar Nav
  def sidebar_nav
    @sidebar_nav = SidebarLink.all
  end



end


































