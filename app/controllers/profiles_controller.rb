class ProfilesController < ApplicationController
  def show
    @user = User.where(:username => request.subdomain).first || not_found
  end

  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end
end
