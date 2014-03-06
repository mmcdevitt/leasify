module ApplicationHelper

	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
			:autolink => true, :space_after_headers => true, :no_intra_emphasis => true, :strikethrough => true,
			:underline => true, :quote => true, :headers => true)
		markdown.render(text).html_safe
	end
	
end
