class AddFontsToThemeOptions < ActiveRecord::Migration
  def change
    add_column :theme_options, :body_font, :string, default: "arial"
    add_column :theme_options, :heading_font, :string, default: "museo-h-bold"
  end
end
