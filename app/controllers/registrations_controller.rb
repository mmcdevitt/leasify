class RegistrationsController < Devise::RegistrationsController
  before_action :set_subdomain
  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
  def settings
    render 'edit'
  end

  def edit
    @sites = Site.where(user_id: current_user.id).all
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end

  def set_subdomain
    @subdomain           = request.subdomain
    @site                = Site.where(subdomain: request.subdomain).first
    @user                = User.where(id: @site.user_id).first
    @themeoptions        = ThemeOption.where(site_id: @site.id).first
    @pages               = Page.where(site_id: @site.id).all
    @availabilities      = Availability.where(site_id: @site.id).all
    @propertyinformation = PropertyInformation.where(site_id: @site.id).first
    @contacts            = Contact.where(site_id: @site.id).all
  end


    
end