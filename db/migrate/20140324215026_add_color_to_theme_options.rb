class AddColorToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :mainheading_color, :string, default: "fff"
  	add_column :theme_options, :subheading_color, :string, default: "fff"
  	add_column :theme_options, :body_color, :string, default: "fff"
  	add_column :theme_options, :footer_color, :string, default: "fff"
  	add_column :theme_options, :nav_color, :string, default: "fff"
  	add_column :theme_options, :navhover_color, :string, default: "f5f5f5"
  end
end
