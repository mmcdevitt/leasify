class AddPositionToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :position, :integer
  end
end
