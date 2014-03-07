class DashboardsController < ApplicationController
  def index
  	@sites = Site.where(user_id: current_user.id).all
  end
end
