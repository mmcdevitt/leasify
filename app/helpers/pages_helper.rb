module PagesHelper

	def page_title
		if params[:action] == 'new'
			"Add Page"
		else
			Page.find(params[:id]).title
		end
	end

	def edit_page_url
		if params[:action] == 'edit' || params[:action] == "update"
			request.subdomain + ".leasify.co/" + @page.slug.downcase
		end
	end

	def parent_pages
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
    
		if (params[:action] == "edit" && params[:controller] == "pages") 
			@page = Page.where(site_id: @site.id).find_by_slug!(params[:id])
	    if !@page.parent_id.blank?
	    	return Page.where(id: @page.parent_id).first.title
	    else
	    	"Selet Parent Page"
	    end
	  else
	  	return "Select Parent Page"
	  end
	end

	def publish_or_draft
		@subdomain = request.subdomain
    @site      = Site.where(subdomain: request.subdomain).first
		if params[:action] == "edit" && params[:controller] == "pages"
			@page = Page.where(site_id: @site.id).find_by_slug!(params[:id])
			if @page.published?
				"Published"
			else
				"Draft"
			end
		else
			"Publish"
		end
	end

	
  

end
