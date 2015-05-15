module DeviseHelper
  #Allow Devise to add custom fields in database

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
end