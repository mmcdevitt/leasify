module StaticPagesHelper

	# Show alert when page is draft on show pages
	def draft_page_error_alert
		if params[:action] == "show" && params[:controller] == "pages"
			if !@page.published?
				'<div class="draft-page-alert center">
				This page is a draft and will not be seen to the public. Choose "Publish" in the edit page when ready.
				</div>'.html_safe
			end
		end
	end

	# Show alert when listing is draft on show pages
  def draft_listing_error_alert
		if params[:action] == "show" && params[:controller] == "availabilities"
			if !@availability.published?
				'<div class="draft-page-alert center">
		      This listing is a draft and will not be seen to the public. Choose "Publish" in the edit page when ready.
		    </div>'.html_safe
			end
		end
	end






















end
