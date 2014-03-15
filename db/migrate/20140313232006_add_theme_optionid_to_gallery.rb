class AddThemeOptionidToGallery < ActiveRecord::Migration
  def change
  	add_column :homepage_galleries, :theme_option_id, :integer
  end
end
