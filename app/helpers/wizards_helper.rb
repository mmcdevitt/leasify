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
		if current_page?(path)
			'class=active'
		end
	end












end
