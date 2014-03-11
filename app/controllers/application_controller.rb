class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include UrlHelper
  protect_from_forgery with: :exception
  
  before_action :correct_user
 
  # layout :theme_name

  #Allow Devise to add custom fields in database

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:username, 
                           :email, 
                           :password, 
                           :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :password, 
                                            :password_confirmation, 
                                            :current_password,
                                            :logo_image,
                                            :template_name)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  # End Devise #############

  def correct_user
    if request.subdomain.present? && request.subdomain != "www"
      if user_signed_in?
        if params[:controller] == 'static_pages' && params[:action] == 'home'
          else
          @subdomain = request.subdomain
          @site = Site.where(subdomain: request.subdomain).first.user_id
          @user = User.where(id: @site).first
          if @user.id != current_user.id
            redirect_to (root_url(:subdomain => false) + "dashboard")
            # sign_out(@user) 
          end
        end
      end
    end
  end

  # def after_sign_in_path_for(resource)
  #   root_url(:subdomain => current_user.username)
  #   sign_in(current_user)
    
  # end

  def theme_name
    
     if params[:action] == "home"
        @theme_name = ThemeOption.where(user_id: current_user.id).first.template.downcase
      else
        "application"
      end
  end



end
