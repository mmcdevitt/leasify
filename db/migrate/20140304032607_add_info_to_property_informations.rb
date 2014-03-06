class AddInfoToPropertyInformations < ActiveRecord::Migration
  def change
    add_column :property_informations, :owner_name, :string
    add_column :property_informations, :property_class, :string
    add_column :property_informations, :floors, :integer
    add_column :property_informations, :sf, :integer
    add_column :property_informations, :year_built, :integer
  end
end
