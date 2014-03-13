class AvailabilityGalleriesController < ApplicationController


	# def create
 #    @gallery = current_user.availability_galleries.new(gallery_params)

 #    respond_to do |format|
 #      if @gallery.save
 #        format.html { redirect_to edit_page_path(@gallery), notice: 'Saved' }
 #        format.json { render action: 'show', status: :created, location: @gallery }
 #      else
 #        format.html { render action: 'new' }
 #        format.json { render json: @gallery.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

 #  def update
 #    respond_to do |format|
 #      session[:return_to] ||= request.referer
 #      if @gallery.update(availability_galleries)
 #        format.html { redirect_to session.delete(:return_to), notice: 'Saved' }
 #        format.json { head :no_content }
 #      else
 #        format.html { render action: 'edit' }
 #        format.json { render json: @gallery.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

	# def gallery_params
	# 	params.require(:availability_galleries).permit(:user_id, :site_id, :availability_image, :availability_id)
	# end


end
