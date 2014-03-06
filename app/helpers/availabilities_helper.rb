module AvailabilitiesHelper

def suite_or_floor_edit
	if @availability.suite_or_floor == "Suite"
		return "Suite #"
	else
		return "Floor #"
	end
end

def suite_or_floor_select
	if (params[:action] == "edit" && params[:controller] == "availabilities") 
    @availability = Availability.find(params[:id])
    return @availability.suite_or_floor
  else
  	return "Suite or Floor"
  end
end

def available_select
	if (params[:action] == "edit" && params[:controller] == "availabilities") 
    @availability = Availability.find(params[:id])
    return @availability.availability
  else
  	return "Avaliability?"
  end
end


end
