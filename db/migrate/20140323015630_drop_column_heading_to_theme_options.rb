class DropColumnHeadingToThemeOptions < ActiveRecord::Migration
  def change

  	remove_column :theme_options, :heading_font

  	add_column :theme_options, :heading_font, :string, default: "museo-h-bold"

  end
end
