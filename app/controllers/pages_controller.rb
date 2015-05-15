class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :redirect_if_www
  layout :theme_name

  include PagesHelper

  def index
  end

  def show
    # @page_root = Page.where(site_id: @site.id, published: true).roots.all(:order => "position")

    if !@page.published? && !user_signed_in?
      redirect_to root_path
    end

    if @site.id != @page.site_id
      redirect_to root_url
    end
  end

  def new
    @pages_feature = Page.where(site_id: @site.id, published: true, feature_on_homepage: true).all
    @page_root = Page.where(site_id: @site.id).roots.all
    @page = Page.new
    @title = "Add Page"
    @mtlg = ""
  end

  def edit
    @pages_feature = Page.where(site_id: @site.id, published: true, feature_on_homepage: true).all
    @page_root = Page.where(site_id: @site.id).roots.all
    @title = @page.title
    @mtlg = "m-t-lg"
    # Protect pages per subdomain
    if @site.id != @page.site_id
      redirect_to dashboard_path
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.new(page_params)

    @page.slug = @page.title.parameterize

    if Page.exists?(slug: @page.slug, site_id: @site.id)
      pages = Page.where(title: @page.title, site_id: @site.id).count
      @page.slug = @page.title.parameterize + "-" + (pages + 1).to_s
    end

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page), notice: 'Saved' }
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
    @pages_feature = Page.where(site_id: @site.id, published: true, feature_on_homepage: true).all
    @page_root = Page.where(site_id: @site.id).roots.all
    @title = @page.title
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @page.update(page_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
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

  def sort
    params[:page].each_with_index do |id, index|
      Page.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @page = Page.where(site_id: @site.id).find_by_slug!(params[:id])
      #@page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:user_id, :position, :slug, :feature_on_homepage, :parent_id, :published, :title, :subtitle, :content, :page_image, :site_id)
    end

    def theme_name
      @subdomain = request.subdomain
      @site = Site.where(subdomain: request.subdomain).first
      @user = User.where(id: @site.user_id).first
      @theme_name = ThemeOption.where(site_id: @site.id).first.template
      @theme = ThemeName.where(id: @theme_name).first.name.downcase
      if params[:action] == "show"
        return @theme + "page"
      else
        "application"
      end
    end

    def redirect_if_www
      if !request.subdomain.present? || request.subdomain == "www"
        redirect_to dashboard_path
      end
    end
end































