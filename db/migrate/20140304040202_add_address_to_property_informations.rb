class AddAddressToPropertyInformations < ActiveRecord::Migration
  def change
    add_column :property_informations, :address, :string
    add_column :property_informations, :state, :string
    add_column :property_informations, :city, :string
    add_column :property_informations, :zipcode, :integer
  end
end
