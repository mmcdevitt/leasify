class AddAmenitiesToPropertyInformations < ActiveRecord::Migration
  def change
  	add_column :property_informations, :kitchen, :boolean
  	add_column :property_informations, :showers, :boolean
  	add_column :property_informations, :reception, :boolean
  	add_column :property_informations, :patio, :boolean
  	add_column :property_informations, :parking_garage, :boolean
  	add_column :property_informations, :lobby_attendant, :boolean
  	add_column :property_informations, :cafeteria, :boolean
  	add_column :property_informations, :onsite_security, :boolean
  	add_column :property_informations, :bathrooms, :boolean
  	add_column :property_informations, :fitness_center, :boolean
  	add_column :property_informations, :bicycles_allowed, :boolean
  	add_column :property_informations, :bicycle_storage, :boolean
  	add_column :property_informations, :dog_friendly, :boolean
  end
end
