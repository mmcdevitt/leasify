class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /contacts
  # GET /contacts.json
  def index
    
    @subdomain           = request.subdomain
    @site                = Site.where(subdomain: request.subdomain).first.id
    @contacts            = Contact.where(user_id: current_user.id) && Contact.where(site_id: @site)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
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
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:site_id, :first_name, :last_name, :company, :job_title, :phone, :email, :user_id)
    end
end
