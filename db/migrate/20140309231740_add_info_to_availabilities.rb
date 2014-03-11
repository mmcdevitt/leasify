class AddInfoToAvailabilities < ActiveRecord::Migration
  def change
  	add_column :availabilities, :floor_location, :integer
  	add_column :availabilities, :type_of_space, :string
  end
end
