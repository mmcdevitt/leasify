module SunnysideHelper

	def show_logo_sunnyside
  	if @themeoptions.show_logo?
  		image_tag(@themeoptions.theme_image.url(:small), class: "img-responsive", id: "logo", style: "margin-top:5px;")
  	else
  		link_to @propertyinformation.name, "/", class: "navbar-brand"
  	end
  end

  def show_logo_avaya
    if @themeoptions.show_logo?
      image_tag(@themeoptions.theme_image.url(:small), class: "img-responsive", id: "logo", style: "margin-top:5px;")
    end
  end

  def show_logo_skyline
  	if @themeoptions.show_logo?
  		image_tag(@themeoptions.theme_image.url(:small), class: "img-responsive", id: "logo")
  	else
  		link_to @propertyinformation.name, "/", class: "navbar-brand"
  	end
  end

  def published_margin
    if params[:action] == "show" && params[:controller] == "pages"
      'margin-top: 50px;' if !@page.published?
    elsif params[:action] == "show" && params[:controller] == "availabilities"
      'margin-top: 50px;' if !@availability.published?
    end
  end

end