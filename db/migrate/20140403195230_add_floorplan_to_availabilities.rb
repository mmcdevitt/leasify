class AddFloorplanToAvailabilities < ActiveRecord::Migration
  def change
  	add_attachment :availabilities, :floorplan_image
  end
end
