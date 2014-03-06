class PropertyInformationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@propertyinformations = PropertyInformations.where(user_id: current_user.id).first
	end

	def address
		@propertyinformations = PropertyInformations.where(user_id: current_user.id).first
	end

	def update
    @propertyinformations = PropertyInformations.where(user_id: current_user.id).first
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
  	def propertyinformations_params
      params.require(:property_informations).permit(:user_id, :name, 
      																							:owner_name, :property_class, :floors, :sf, :year_built,
      																							:state, :address, :city, :zipcode)
    end


end
