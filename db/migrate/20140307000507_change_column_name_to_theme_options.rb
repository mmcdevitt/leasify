class ChangeColumnNameToThemeOptions < ActiveRecord::Migration
  def change
  	rename_column :theme_options, :subdomain_id, :site_id
  	rename_column :property_informations, :subdomain_id, :site_id
  	rename_column :pages, :subdomain_id, :site_id
  	rename_column :availabilities, :subdomain_id, :site_id
  	rename_column :contacts, :subdomain_id, :site_id
  end
end
