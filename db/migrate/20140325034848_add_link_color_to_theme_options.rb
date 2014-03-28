class AddLinkColorToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :link_color, :string, default: "#428bca"
  end
end
