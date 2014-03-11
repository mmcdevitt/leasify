module ApplicationHelper

	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
			:autolink => true, :space_after_headers => true, :no_intra_emphasis => true, :strikethrough => true,
			:underline => true, :quote => true, :headers => true)
		markdown.render(text).html_safe
	end

	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-success"
		else
			""
		end
	end

	def full_address
		@propertyinformation.address + 
		", " + @propertyinformation.city + 
		", " + @propertyinformation.state
	end 

	# Admin link for front end templates
	def admin_link
		@subdomain = request.subdomain
		@site = Site.where(subdomain: request.subdomain).first.user_id
		@user = User.where(id: @site).first
		if user_signed_in? && @user.id == current_user.id
			html = '<li>' + (link_to "Dashboard", dashboard_path, target: "_blank") +  '</li>'
			html.html_safe
		end
	end
	
end
