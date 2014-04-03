class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_subdomain
  before_action :redirect_if_www
  # GET /contacts
  # GET /contacts.json
  def index
   
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    redirect_to contacts_path
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @edit_name = "Add"
  end

  # GET /contacts/1/edit
  def edit
    @edit_name = "Edit"
     # Protect contacts per subdomain
    if @site.id != @contact.site_id
      redirect_to dashboard_path
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to edit_contact_path(@contact), notice: 'Saved' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @contact.update(contact_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:contact].each_with_index do |id, index|
      Contact.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:site_id, :first_name, :last_name, :position, :company, :job_title, :phone, :email, :user_id)
    end
    def set_subdomain
      if request.subdomain.present? && request.subdomain != "www"
        @subdomain           = request.subdomain
        @site                = Site.where(subdomain: request.subdomain).first
        @user                = User.where(id: @site.user_id).first
        @themeoptions        = ThemeOption.where(site_id: @site.id).first
        @pages               = Page.where(site_id: @site.id).all
        @availabilities      = Availability.where(site_id: @site.id).all
        @propertyinformation = PropertyInformation.where(site_id: @site.id).first
        @contacts            = Contact.where(site_id: @site.id).all(:order => "position")
      end
    end

    def redirect_if_www
      if !request.subdomain.present? || request.subdomain == "www"
        redirect_to dashboard_path
      end
    end

end






























