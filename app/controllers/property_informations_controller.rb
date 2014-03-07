class PropertyInformationsController < ApplicationController
  before_action :set_subdomain
	before_action :authenticate_user!

	def index
		@propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site).first
	end

	def address
		@propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site).first
	end

	def update
    @propertyinformations = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site).first
    # if params[:propertyinformations] && params[:propertyinformations].has_key?(:user_id)
    #   params[:propertyinformations].delete(:user_id) 
    # end
    respond_to do |format|
      if @propertyinformations.update(propertyinformations_params)
        format.html { redirect_to property_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @propertyinformations.errors, status: :unprocessable_entity }
      end
    end
  end

  private	
    def set_subdomain
      @subdomain = request.subdomain
      @site      = Site.where(subdomain: request.subdomain).first.id
    end
  	def propertyinformations_params
      params.require(:property_information).permit(:user_id, :name, 
      																							:owner_name, :property_class, :floors, :sf, :year_built,
      																							:state, :address, :city, :zipcode)
    end


end
