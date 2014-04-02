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
		if @propertyinformation.address.nil?
		else
			@propertyinformation.address + 
			", " + @propertyinformation.city + 
			", " + @propertyinformation.state
		end
	end 

	# Admin link for front end templates
	def admin_link
		# @subdomain = request.subdomain
		# @site = Site.where(subdomain: request.subdomain).first.user_id
		# @user = User.where(id: @site).first
		if user_signed_in? && @user.id == current_user.id
			html = '<li>' + (link_to '<i class="fa fa-cog"></i> Admin'.html_safe, dashboard_path, target: "_blank") +  '</li>'
			html.html_safe
		end
	end

	def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

	def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end


  def current_site_id
  	@subdomain = request.subdomain
    @site = Site.where(subdomain: request.subdomain).first.id
  end

  def nav_xs_wizards_homepage
  	"nav-xs" if params[:controller] == 'wizards' && params[:action] == "homepage_content"
  end

  



































  
	
end














































