class AddImageToThemeOptions < ActiveRecord::Migration
  def change
  	add_attachment :theme_options, :homepage_image
  end
end
