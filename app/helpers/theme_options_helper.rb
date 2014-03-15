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


	# Print out correct font name on Theme Settings page, instead of the actual value
	def heading_name
		case @themeoptions.heading_font
		when 'times-h'
			"Times New Roman"
		when 'impact-h'
			"Impact"
		when 'georgia-h'
			"Georgia"
		when 'palantino-h'
			"Palantino"
		when 'arial-h'
			"Arial"
		when 'arialblack-h'
			"Arial Black"
		when 'lucidasans-h'
			"Lucida Sans"
		when 'tahoma-h'
			"Tahoma"
		when 'trebuchet-h'
			"Trebuchet"
		when 'verdana-h'
			"Verdana"
		when 'lucida-h'
			"Lucida Console"
		when 'courier-h'
			"Courier New"
		else
			""
		end
	end

	def font_name
		case @themeoptions.body_font
		when 'times'
			"Times New Roman"
		when 'impact'
			"Impact"
		when 'georgia'
			"Georgia"
		when 'palantino'
			"Palantino"
		when 'arial'
			"Arial"
		when 'arialblack'
			"Arial Black"
		when 'lucidasans'
			"Lucida Sans"
		when 'tahoma'
			"Tahoma"
		when 'trebuchet'
			"Trebuchet"
		when 'verdana'
			"Verdana"
		when 'lucida'
			"Lucida Console"
		when 'courier'
			"Courier New"
		else
			""
		end
	end


	


end
