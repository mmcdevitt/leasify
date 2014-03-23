class AddLogoShowToThemeOptions < ActiveRecord::Migration
  def change
    add_column :theme_options, :show_logo, :boolean
  end
end
