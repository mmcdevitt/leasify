class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :set_subdomain_avail
  before_action :redirect_if_www
  # GET /availabilities
  # GET /availabilities.json
  layout :theme_name
  def index
    # @subdomain           = request.subdomain
    # @site                = Site.where(subdomain: request.subdomain).first.id
    
    # @availabilities      = Availability.where(user_id: current_user.id) && Availability.where(site_id: @site)
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
    @availabilities_image = AvailabilityGallery.where(site_id: @site.id, availability_id: @availability.id).all
    if @site.id != @availability.site_id
      redirect_to root_url
    end

    if !@availability.published? && !user_signed_in?
      redirect_to root_path
    end
  end

  # GET /availabilities/new
  def new
    @availability = Availability.new
    @avail_title = "Add Listing"
    @availability.availability_galleries.build  
  end

  # GET /availabilities/1/edit
  def edit
    @avail_title = @availability.suite_or_floor + " #" + @availability.title
    @galleries = AvailabilityGallery.where(site_id: @site.id, availability_id: @availability).all 
   

    # Protect availabilities per subdomain
    if @site.id != @availability.site_id
      redirect_to dashboard_path
    end
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = current_user.availabilities.new(availability_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to edit_availability_path(@availability), notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @availability }
      else
        format.html { render action: 'new' }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availabilities/1
  # PATCH/PUT /availabilities/1.json
  def update
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @availability.update(availability_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:availability].each_with_index do |id, index|
      Availability.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end

    def set_subdomain_avail
      if request.subdomain.present? && request.subdomain != "www"
        @subdomain            = request.subdomain
        @site                 = Site.where(subdomain: request.subdomain).first
        @user                 = User.where(id: @site.user_id).first
        @themeoptions         = ThemeOption.where(site_id: @site.id).first
        @pages                = Page.where(site_id: @site.id).all
        @page_root            = Page.where(site_id: @site.id, published: true).roots.all(:order => "position")
        @availabilities       = Availability.where(site_id: @site.id).all(:order => "position")
        @propertyinformation  = PropertyInformation.where(site_id: @site.id).first
        @contacts             = Contact.where(site_id: @site.id).all(:order => "position")
      end
    end

    def redirect_if_www
      if !request.subdomain.present? || request.subdomain == "www"
        redirect_to dashboard_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(:title, 
                                           :site_id, 
                                           :suite_or_floor, 
                                           :availability, 
                                           :sf, 
                                           :rental_rate, 
                                           :content, 
                                           :user_id, 
                                           :floor_location, 
                                           :type_of_space,
                                           :published,
                                           :position,
                                           availability_galleries_attributes: [:user_id, :id, :availability_image, :site_id, :_destroy])
    end

    def theme_name
      @subdomain = request.subdomain
      @site = Site.where(subdomain: request.subdomain).first
      @user = User.where(id: @site.user_id).first
      @theme_name = ThemeOption.where(site_id: @site.id).first.template
      @theme = ThemeName.where(id: @theme_name).first.name.downcase
      if params[:action] == "show"
        @theme + "leasing-single"
      else
        "application"
      end
    end
end































