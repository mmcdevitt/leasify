class DropColumnNameToSites < ActiveRecord::Migration
  def change
  	remove_column :sites, :name
  end
end
