module SunnysideHelper


	def show_logo_sunnyside
  	if @themeoptions.show_logo?
  		image_tag(@themeoptions.theme_image.url(:small), class: "img-responsive")
  	else
  		link_to @propertyinformation.name, "/", class: "navbar-brand"
  	end
  end

  def show_logo_skyline
  	if @themeoptions.show_logo?
  		image_tag(@themeoptions.theme_image.url(:small), class: "img-responsive")
  	else
  		link_to @propertyinformation.name, "/"
  	end
  end



end
