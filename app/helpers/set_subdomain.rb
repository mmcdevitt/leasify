module SetSubdomain
  def set_subdomain
    if request.subdomain != "www" && request.subdomain.present?
      @site                = Site.find_by_subdomain(request.subdomain)
      @user                = @site.user
      @themeoptions        = @site.theme_options.first
      @pages               = @site.pages
      @pages_feature       = Page.featured(@site.id)
      @page_root           = Page.root(@site.id)
      @availabilities      = @site.availabilities
      @propertyinformation = @site.property_informations.first
      @homepage_gallery    = @site.homepage_galleries.first
      @homepage_galleries  = @site.homepage_galleries
      @contacts            = @site.contacts
    else
      if user_signed_in?
        @sites = Site.where(user_id: current_user.id).all
      end
    end
  end
end