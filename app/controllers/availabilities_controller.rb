class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /availabilities
  # GET /availabilities.json
  def index
    @subdomain           = request.subdomain
    @site                = Site.where(subdomain: request.subdomain).first.id
    
    @availabilities      = Availability.where(user_id: current_user.id) && Availability.where(site_id: @site)
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
  end

  # GET /availabilities/new
  def new
    @availability = Availability.new
    @avail_title = "Add Listing"
  end

  # GET /availabilities/1/edit
  def edit
    @avail_title = @availability.title
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = current_user.availabilities.new(availability_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to edit_availability_path(@availability), notice: 'Availability was successfully created.' }
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
        format.html { redirect_to session.delete(:return_to), notice: 'Availability was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(:title, :site_id, :suite_or_floor, :availability, :sf, :rental_rate, :content, :user_id)
    end
end
