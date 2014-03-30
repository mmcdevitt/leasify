module ThemeNamesHelper

	def publish_or_draft_theme_name
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
		if params[:action] == "edit" && params[:controller] == "theme_names"
			@themename = ThemeName.find(params[:id])
			if @themename.published?
				"Published"
			else
				"Draft"
			end
		else
			"Publish"
		end
	end



end
