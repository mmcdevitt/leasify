class DashboardsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@sites = Site.where(user_id: current_user.id).all
  	
  		
  	
  end
end
