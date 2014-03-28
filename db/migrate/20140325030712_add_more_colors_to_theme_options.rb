class AddMoreColorsToThemeOptions < ActiveRecord::Migration
  def change
  	change_column :theme_options, :mainheading_color, :string, default: "#fff"
  	change_column :theme_options, :subheading_color, :string, default: "#fff"
  	change_column :theme_options, :body_color, :string, default: "#000"
  	change_column :theme_options, :footer_color, :string, default: "#fff"
  	change_column :theme_options, :nav_color, :string, default: "#fff"
  	change_column :theme_options, :navhover_color, :string, default: "#f5f5f5"

  	add_column :theme_options, :body_heading_color, :string, default: "#000"
  end
end
