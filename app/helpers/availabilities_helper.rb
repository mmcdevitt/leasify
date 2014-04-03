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

  def space_select
    if (params[:action] == "edit" && params[:controller] == "availabilities") 
      @availability = Availability.find(params[:id])
      return @availability.type_of_space
    else
      return "Type of Space?"
    end
  end

  def publish_or_draft_avail
    @subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
    if params[:action] == "edit" && params[:controller] == "availabilities"
      @availability = Availability.find(params[:id])
      if @availability.published?
        "Published"
      else
        "Draft"
      end
    else
      "Publish"
    end
  end

  def edit_listing_url
    if params[:action] == 'edit'
      request.subdomain + ".leasify.co/leasing/" + @availability.id.to_s
    end
  end

  def amenities_muted_if_false(amenity)
    "class=text-muted-for-amenities" unless PropertyInformation.where(amenity.name => true).first
  end

  def amenities_check_if_true(amenity)
    if PropertyInformation.where(amenity.name => true).first
      '<i class="fa fa-check"></i>'.html_safe 
    else
      '<span style="margin-left:18px"></span>'.html_safe
    end
  end

end






































