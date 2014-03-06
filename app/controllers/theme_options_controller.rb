class ThemeOptionsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first
  end

  def homepage_content
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first
  end

  def template
  	@themeoptions = ThemeOption.where(user_id: current_user.id).first
  	@templates = ThemeName.all
  end

  def homepage_gallery
    @themeoptions = ThemeOption.where(user_id: current_user.id).first
  end

	def update
		@themeoptions = ThemeOption.where(user_id: current_user.id).first
		# if params[:propertyinformations] && params[:propertyinformations].has_key?(:user_id)
		#   params[:propertyinformations].delete(:user_id) 
		# end
		respond_to do |format|
			session[:return_to] ||= request.referer
		  if @themeoptions.update(users_params)
		    format.html { redirect_to session.delete(:return_to), notice: 'Event was successfully updated.' }
		    format.json { head :no_content }
		  else
		    format.html { render action: 'edit' }
		    format.json { render json: @themeoptions.errors, status: :unprocessable_entity }
		  end
		end
	end

  private	
  	def users_params
      params.require(:theme_option).permit(:theme_image, 
      																		 :user_id, 
      																		 :homepage_heading, 
      																		 :homepage_subheading, 
      																		 :content,
      																		 :template,
                                           :homepage_image)
    end
end
