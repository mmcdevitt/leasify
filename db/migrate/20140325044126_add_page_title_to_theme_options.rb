class AddPageTitleToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :page_title_size, :integer, default: 40
  	add_column :theme_options, :page_subtitle_size, :integer, default: 14
  	add_column :theme_options, :page_title_color, :string, default: "#fff"
  	add_column :theme_options, :page_subtitle_color, :string, default: "#fff"
  end
end
