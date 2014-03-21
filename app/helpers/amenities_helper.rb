module AmenitiesHelper


	def amenities_select
		if (params[:action] == "edit" && params[:controller] == "amenities") 
	    @amenitie = Amenity.find(params[:id])
	    return @amenitie.category
	  else
	  	return "Category"
	  end
	end



end
