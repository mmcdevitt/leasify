class AddSubdomainIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :subdomain_id, :integer
  end
end
