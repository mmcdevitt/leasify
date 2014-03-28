module PropertyInformationsHelper

	def property_class_select
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first.id
		@property = PropertyInformation.where(user_id: current_user.id).first && PropertyInformation.where(site_id: @site).first
		if  @property.property_class == nil
	    return "Select Class"
	    
	  else
	  	return @property.property_class
	  end
	end

	def state_select
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
    @property_informations = PropertyInformation.where(site_id: @site.id).first
		if (params[:action] == "address" && params[:controller] == "property_informations") && !@property_informations.state.nil?
	    return @property_informations.state
	  else
	  	return "Select State"
	  end
	end

end
