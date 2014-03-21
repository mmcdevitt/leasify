class PropertyInformationsController < ApplicationController
  before_action :set_subdomain
	before_action :authenticate_user!

	def index
		@propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site.id).first
	end

	def address
		@propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site.id).first
	end

  def amenities
    @propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site.id).first
    @amenities_common = Amenity.where(category: "Common")
    @amenities_extra = Amenity.where(category: "Extra")
  end

	def update
    @propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site.id).first
    # if params[:propertyinformations] && params[:propertyinformations].has_key?(:user_id)
    #   params[:propertyinformations].delete(:user_id) 
    # end
    respond_to do |format|
       session[:return_to] ||= request.referer
      if @propertyinformations.update(propertyinformations_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @propertyinformations.errors, status: :unprocessable_entity }
      end
    end
  end

  private	
    def set_subdomain
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @user                = User.where(id: @site.user_id).first
      @themeoptions        = ThemeOption.where(site_id: @site.id).first
      @pages               = Page.where(site_id: @site.id).all
      @availabilities      = Availability.where(site_id: @site.id).all
      
      @contacts            = Contact.where(site_id: @site.id).all
    end
  	def propertyinformations_params
      params.require(:property_information).permit(:user_id, :name, 
      																							:owner_name, :property_class, :floors, :sf, :year_built,
      																							:state, :address, :city, :zipcode, :kitchen, :showers, :reception,
                                                    :patio, :parking_garage, :lobby_attendant, :cafeteria, :onsite_security,
                                                    :bathrooms, :fitness_center, :bicycles_allowed, :bicycle_storage,
                                                    :dog_friendly)
    end




end
