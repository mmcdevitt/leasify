class RemoveThemeOptionIdFromHomepageGalleries < ActiveRecord::Migration
  def change
  	remove_column :homepage_galleries, :theme_option_id
  end
end
