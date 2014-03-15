class SidebarLinksController < ApplicationController
  before_action :set_sidebar_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_role
  # GET /sidebar_links
  # GET /sidebar_links.json
  def index
    @sidebar_links = SidebarLink.all
  end

  # GET /sidebar_links/1
  # GET /sidebar_links/1.json
  def show
  end

  # GET /sidebar_links/new
  def new
    @sidebar_link = SidebarLink.new
  end

  # GET /sidebar_links/1/edit
  def edit
  end

  # POST /sidebar_links
  # POST /sidebar_links.json
  def create
    @sidebar_link = SidebarLink.new(sidebar_link_params)

    respond_to do |format|
      if @sidebar_link.save
        format.html { redirect_to @sidebar_link, notice: 'Sidebar link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sidebar_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @sidebar_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidebar_links/1
  # PATCH/PUT /sidebar_links/1.json
  def update
    respond_to do |format|
      if @sidebar_link.update(sidebar_link_params)
        format.html { redirect_to @sidebar_link, notice: 'Sidebar link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sidebar_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidebar_links/1
  # DELETE /sidebar_links/1.json
  def destroy
    @sidebar_link.destroy
    respond_to do |format|
      format.html { redirect_to sidebar_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidebar_link
      @sidebar_link = SidebarLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidebar_link_params
      params.require(:sidebar_link).permit(:name, :link_to, :icon)
    end

     def admin_role
      unless current_user.admin?
        redirect_to dashboard_path
      end
    end
end
