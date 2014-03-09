class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  layout :theme_name
  include PagesHelper
  # GET /pages
  # GET /pages.json
  def index
    @subdomain           = request.subdomain
    @site                = Site.where(subdomain: request.subdomain).first.id
    @pages               = Page.where(user_id: current_user.id) && Page.where(site_id: @site)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @subdomain           = request.subdomain
    @site                = Site.where(subdomain: request.subdomain).first
    @user                = User.where(id: @site.user_id).first
    @themeoptions        = ThemeOption.where(site_id: @site.id).first
    @pages               = Page.where(site_id: @site.id).all
    @availabilities      = Availability.where(site_id: @site.id).all
    @propertyinformation = PropertyInformation.where(site_id: @site.id).first

    if @site.id != @page.site_id
      redirect_to root_url
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    @title = "Add Page"
  end

  # GET /pages/1/edit
  def edit
    @title = @page.title
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @page.update(page_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:user_id, :title, :subtitle, :content, :page_image, :site_id)
    end

    def theme_name
      @subdomain = request.subdomain
      @site = Site.where(subdomain: request.subdomain).first
      @user = User.where(id: @site.user_id).first
      @theme_name = ThemeOption.where(site_id: @site.id).first.template.downcase
      if params[:action] == "show"
        return @theme_name + "page"
      else
        "application"
      end
    end
end































