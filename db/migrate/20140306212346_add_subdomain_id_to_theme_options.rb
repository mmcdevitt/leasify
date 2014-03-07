class AddSubdomainIdToThemeOptions < ActiveRecord::Migration
  def change
    add_column :theme_options, :subdomain_id, :integer
  end
end
