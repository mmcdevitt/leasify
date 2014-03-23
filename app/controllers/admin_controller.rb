class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_role
	layout :slider_test_layout
	def index
	end

	def users_list
		@users = User.all
	end

	def admin_role
    unless current_user.admin?
      redirect_to dashboard_path
    end
  end

  def slider_test
    @gallery = HomepageGallery.where(site_id: 41).all
  end

  def slider_test_layout
  	if params[:action] == "slider_test"
  		"slider"
  	end
  end

end
