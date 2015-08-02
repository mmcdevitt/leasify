class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_role
  # GET /amenities
  # GET /amenities.json
  def index
    @amenities = Amenity.all
  end

  # GET /amenities/1
  # GET /amenities/1.json
  def show
  end

  # GET /amenities/new
  def new
    @amenity = Amenity.new
  end

  # GET /amenities/1/edit
  def edit
  end

  # POST /amenities
  # POST /amenities.json
  def create
    @amenity = Amenity.new(amenity_params)

    respond_to do |format|
      if @amenity.save
        format.html { redirect_to @amenity, notice: 'Amenity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @amenity }
      else
        format.html { render action: 'new' }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amenities/1
  # PATCH/PUT /amenities/1.json
  def update
    respond_to do |format|
      if @amenity.update(amenity_params)
        format.html { redirect_to @amenity, notice: 'Amenity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amenities/1
  # DELETE /amenities/1.json
  def destroy
    @amenity.destroy
    respond_to do |format|
      format.html { redirect_to amenities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amenity_params
      params.require(:amenity).permit(:name, :category)
    end


    def admin_role
      redirect_to dashboard_path unless current_user.admin?
    end
end
