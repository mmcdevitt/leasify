class AddUnlimitedSitesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unlimited_sites, :boolean, default: false
  end
end
