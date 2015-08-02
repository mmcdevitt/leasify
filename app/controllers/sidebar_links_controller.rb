class SidebarLinksController < ApplicationController
  before_action :set_sidebar_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_role

  def index
    @sidebar_links = SidebarLink.all
  end

  def show
  end

  def new
    @sidebar_link = SidebarLink.new
    @title = "New Sidebar Link"
  end

  # GET /sidebar_links/1/edit
  def edit
    @title = @sidebar_link.name
  end

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

  def destroy
    @sidebar_link.destroy
    respond_to do |format|
      format.html { redirect_to sidebar_links_url }
      format.json { head :no_content }
    end
  end

  private

  def set_sidebar_link
    @sidebar_link = SidebarLink.find(params[:id])
  end

  def sidebar_link_params
    params.require(:sidebar_link).permit(:name, :link_to, :icon)
  end

  def admin_role
    redirect_to dashboard_path unless current_user.admin?
  end
end
