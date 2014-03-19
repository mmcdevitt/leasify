class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_role
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

end
