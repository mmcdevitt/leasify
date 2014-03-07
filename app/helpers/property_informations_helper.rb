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

end
