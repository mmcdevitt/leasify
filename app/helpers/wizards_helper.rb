module WizardsHelper

	def state_select_wizard
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
    @property_informations = PropertyInformation.where(site_id: @site.id).first
		if (params[:controller] == "wizards") && !@property_informations.state.nil?
	    return @property_informations.state
	  else
	  	return "Select State"
	  end
	end

	def active_class(path)
		'class=active' if current_page?(path)
	end

	def active_class_wo_class(path)
		'active' if current_page?(path)
	end

end