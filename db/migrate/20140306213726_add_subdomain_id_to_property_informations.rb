class AddSubdomainIdToPropertyInformations < ActiveRecord::Migration
  def change
    add_column :property_informations, :subdomain_id, :integer
  end
end
