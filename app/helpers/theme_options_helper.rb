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
		when 'proximanova-h'
			"Proxima Nova"
		when 'proximanova-h-light'
			"Proxima Nova Light"
		when 'proximanova-h-bold'
			"Proxima Nova Bold"
		when 'futura-h'
			"Futura"
		when 'futura-h-bold'
			"Futura Bold"
		when 'futura-h-light'
			"Futura Light"
		when 'penna-h'
			"Penna"
		when 'museo-h'
			"Museo Sans"
		when 'museo-h-bold'
			"Museo Sans Bold"
		when 'museo-h-light'
			"Museo Sans Light"
		when 'garamond-h'
			"Adobe Garamond Pro"
		when 'garamond-h-bold'
			"Adobe Garamond Pro Bold"
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
		when 'proximanova'
			"Proxima Nova"
		when 'proximanova-light'
			"Proxima Nova Light"
		when 'proximanova-bold'
			"Proxima Nova Bold"
		when 'futura'
			"Futura"
		when 'futura-light'
			"Futura Light"
		when 'futura-bold'
			"Futura Bold"
		when 'penna'
			"Penna"
		when 'museo'
			"Museo Sans"
		when 'museo-bold'
			"Museo Sans Bold"
		when 'museo-light'
			"Museo Sans Light"
		when 'garamond'
			"Adobe Garamond Pro"
		when 'garamond-bold'
			"Adobe Garamond Pro Bold"
		else
			""
		end
	end

	def font_name_for_body_css
		case @themeoptions.body_font
		when 'times'
			'font-family: "Times New Roman", Times, serif;'
		when 'impact'
			'font-family: Impact, Charcoal, sans-serif;'
		when 'georgia'
			'font-family: Georgia, serif;'
		when 'palantino'
			'font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;'
		when 'arial'
			'font-family: Arial, Helvetica, sans-serif;'
		when 'arialblack'
			'font-family: "Arial Black", Gadget, sans-serif;'
		when 'lucidasans'
			'font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;'
		when 'tahoma'
			'font-family: Tahoma, Geneva, sans-serif;'
		when 'trebuchet'
			'font-family: "Trebuchet MS", Helvetica, sans-serif;'
		when 'verdana'
			'font-family: Verdana, Geneva, sans-serif;'
		when 'lucida'
			'font-family: "Lucida Console", Monaco, monospace;'
		when 'courier'
			'font-family: "Courier New", Courier, monospace;'
		when 'proximanova'
			'font-family: "proxima-nova",sans-serif; '
		when 'proximanova-light'
			'font-family: "proxima-nova",sans-serif;font-weight: 300 !important;'
		when 'proximanova-bold'
			'font-family: "proxima-nova",sans-serif;font-weight: 700 !important;'
		when 'futura'
			'font-family: "futura-pt",sans-serif; '
		when 'futura-light'
			'font-family: "futura-pt",sans-serif;font-weight: 300 !important;'
		when 'futura-bold'
			'font-family: "futura-pt",sans-serif;font-weight: 700 !important;'
		when 'penna'
			'font-family: "penna",sans-serif;'
		when 'museo'
			'font-family: "museo-sans",sans-serif;'
		when 'museo-bold'
			'font-family: "museo-sans",sans-serif;font-weight: 700 !important;'
		when 'museo-light'
			'font-family: "museo-sans",sans-serif;font-weight: 100 !important;'
		when 'garamond'
			'font-family: "adobe-garamond-pro",sans-serif;font-weight: 400 !important;'
		when 'garamond-bold'
			'font-family: "adobe-garamond-pro",sans-serif;font-weight: 700 !important;'
		else
			""
		end
	end


	def font_name_for_heading_css
		case @themeoptions.heading_font
		when 'times-h'
			'font-family: "Times New Roman", Times, serif;'
		when 'impact-h'
			'font-family: Impact, Charcoal, sans-serif;'
		when 'georgia-h'
			'font-family: Georgia, serif;'
		when 'palantino-h'
			'font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;'
		when 'arial-h'
			'font-family: Arial, Helvetica, sans-serif;'
		when 'arialblack-h'
			'font-family: "Arial Black", Gadget, sans-serif;'
		when 'lucidasans-h'
			'font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;'
		when 'tahoma-h'
			'font-family: Tahoma, Geneva, sans-serif;'
		when 'trebuchet-h'
			'font-family: "Trebuchet MS", Helvetica, sans-serif;'
		when 'verdana-h'
			'font-family: Verdana, Geneva, sans-serif;'
		when 'lucida-h'
			'font-family: "Lucida Console", Monaco, monospace;'
		when 'courier-h'
			'font-family: "Courier New", Courier, monospace;'
		when 'proximanova-h'
			'font-family: "proxima-nova",sans-serif; '
		when 'proximanova-h-light'
			'font-family: "proxima-nova",sans-serif;font-weight: 300 !important;'
		when 'proximanova-h-bold'
			'font-family: "proxima-nova",sans-serif;font-weight: 700 !important;'
		when 'futura-h'
			'font-family: "futura-pt",sans-serif; '
		when 'futura-h-light'
			'font-family: "futura-pt",sans-serif;font-weight: 300 !important;'
		when 'futura-h-bold'
			'font-family: "futura-pt",sans-serif;font-weight: 700 !important;'
		when 'penna-h'
			'font-family: "penna",sans-serif;font-weight: 700 !important;'
		when 'museo-h'
			'font-family: "museo-sans",sans-serif;'
		when 'museo-h-bold'
			'font-family: "museo-sans",sans-serif;font-weight: 700 !important;'
		when 'museo-h-light'
			'font-family: "museo-sans",sans-serif;font-weight: 100 !important;'
		when 'garamond-h'
			'font-family: "adobe-garamond-pro",sans-serif;font-weight: 400 !important;'
		when 'garamond-h-bold'
			'font-family: "adobe-garamond-pro",sans-serif;font-weight: 700 !important;'
		else
			""
		end
	end


	


end





























