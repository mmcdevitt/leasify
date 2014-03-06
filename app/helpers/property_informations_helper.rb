module PropertyInformationsHelper

	def property_class_select
		@property = PropertyInformations.where(user_id: current_user.id).first
		if  @property.property_class == nil
	    return "Select Class"
	    
	  else
	  	return @property.property_class
	  end
	end

end
