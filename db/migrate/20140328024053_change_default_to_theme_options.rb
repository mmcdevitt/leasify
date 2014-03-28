class ChangeDefaultToThemeOptions < ActiveRecord::Migration
  def change
  	change_column :theme_options, :footer_color, :string, default: "#999"
  end
end
