module PagesHelper

	def page_title
		if params[:action] == 'new'
			"Add Page"
		else
			Page.find(params[:id]).title
		end
	end

	def edit_page_url
		if params[:action] == 'edit'
			request.subdomain + ".leasify.co/" + @page.slug.downcase
		end
	end

	
  

end
