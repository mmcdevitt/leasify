class AddToSubdomainIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :subdomain_id, :integer
  end
end
