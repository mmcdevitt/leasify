class ChangeColumnNameToAvailabilityGallery < ActiveRecord::Migration
  def change
  	rename_column :availability_galleries, :availabilities_id, :availability_id
  end
end
