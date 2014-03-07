class AddSubdomainIdToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :subdomain_id, :integer
  end
end
