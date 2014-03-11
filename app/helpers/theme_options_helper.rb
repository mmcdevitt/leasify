module ThemeOptionsHelper

	def active_template(template)
		@subdomain = request.subdomain
    @site = Site.where(subdomain: request.subdomain).first.id
		if ThemeOption.where(site_id: @site).first.template == template.id
			"success disabled"
		else
			"default"
		end
	end

	def is_active_template(template)
		@subdomain = request.subdomain
    @site = Site.where(subdomain: request.subdomain).first.id
		if ThemeOption.where(site_id: @site).first.template == template.id
			"Active"
		else
			"Activate"
		end
	end

	


end
